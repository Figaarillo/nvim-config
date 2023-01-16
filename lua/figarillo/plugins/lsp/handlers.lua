local M = {}
local keymap = vim.keymap.set

local status_cmp_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_cmp_ok then
	return
end

-- M.capabilities = vim.lsp.protocol.make_client_capabilities()
-- M.capabilities.offsetEncoding = { "utf-16" }
-- M.capabilities.textDocument.completion.completionItem.snippetSupport = true
M.capabilities = cmp_nvim_lsp.default_capabilities()

M.setup = function()
	local config = {
		virtual_text = true, -- Enable virtual text
		signs = false, -- Do not show signs
		update_in_insert = true,
		underline = true,
		severity_sort = true,
		float = {
			focusable = false,
			style = "minimal",
			border = "rounded",
			source = "always",
			header = "",
			prefix = "",
		},
	}

	vim.diagnostic.config(config)

	vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
		border = "rounded",
	})

	vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
		border = "rounded",
	})
end

local function lsp_keymaps(bufnr)
	local buf_opts = { buffer = bufnr, silent = true }
	keymap("n", "gD", vim.lsp.buf.declaration, buf_opts)
	keymap("n", "gd", vim.lsp.buf.definition, buf_opts)
	keymap("n", "gl", "<cmd>Lspsaga show_line_diagnostics<CR>", buf_opts)
	keymap("n", "gp", "<cmd>Lspsaga peek_definition<CR>", buf_opts)
	keymap("n", "K", vim.lsp.buf.hover, buf_opts)
	keymap("n", "gi", vim.lsp.buf.implementation, buf_opts)
end

local function lsp_highlight(client)
	local status_ok, illuminate = pcall(require, "illuminate")
	if not status_ok then
		return
	end
	illuminate.on_attach(client)
end

M.on_attach = function(client, bufnr)
	lsp_keymaps(bufnr)
	lsp_highlight(client)
	vim.api.nvim_buf_create_user_command(bufnr, "Format", function(_)
		vim.lsp.buf.format()
	end, { desc = "Format current buffer with LSP" })
end

return M
