local M = {}
local keymap = vim.keymap.set

--[[ local status_cmp_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_cmp_ok then
	return
end ]]
-- M.capabilities = vim.lsp.protocol.make_client_capabilities()
-- M.capabilities.offsetEncoding = { "utf-16" }
-- M.capabilities.textDocument.completion.completionItem.snippetSupport = true
-- M.capabilities = cmp_nvim_lsp.default_capabilities()

local _cmp_nvim_lsp, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
M.capabilities = _cmp_nvim_lsp and cmp_nvim_lsp.default_capabilities() or vim.lsp.protocol.make_client_capabilities()
M.capabilities.textDocument.completion.completionItem.snippetSupport = true

M.setup = function()
	local config = {
		virtual_text = {
			prefix = "",
		}, -- Enable virtual text
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
	keymap("n", "gi", vim.lsp.buf.implementation, buf_opts)
	keymap("n", "<space>wa", vim.lsp.buf.add_workspace_folder, buf_opts)
	keymap("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, buf_opts)
	keymap("n", "<space>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", buf_opts)
end

local function lsp_highlight(client)
	local status_ok, illuminate = pcall(require, "illuminate")
	if not status_ok then
		return
	end
	illuminate.on_attach(client)
end

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
-- local group = vim.api.nvim_create_augroup("lsp_format_on_save", { clear = false })
local event = "BufWritePre" -- or "BufWritePost"
-- local async = event == "BufWritePost"

M.on_attach = function(client, bufnr)
	lsp_keymaps(bufnr)
	lsp_highlight(client)

	if client.supports_method("textDocument/formatting") then
		vim.keymap.set("n", "<Leader>f", function()
			vim.lsp.buf.format({ bufnr = vim.api.nvim_get_current_buf() })
		end, { buffer = bufnr, desc = "[lsp] format" })

		vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
		vim.api.nvim_create_autocmd(event, {
			group = augroup,
			buffer = bufnr,
			callback = function()
				-- vim.lsp.buf.format({ bufnr = bufnr, async = async })
				vim.lsp.buf.format({ timeout = 2000, bufnr = bufnr })
			end,
		})
	end

	if client.supports_method("textDocument/rangeFormatting") then
		vim.keymap.set("x", "<Leader>f", function()
			vim.lsp.buf.format({ bufnr = vim.api.nvim_get_current_buf() })
		end, { buffer = bufnr, desc = "[lsp] format" })
	end

	vim.api.nvim_buf_create_user_command(bufnr, "Format", function(_)
		vim.lsp.buf.format()
	end, { desc = "Format current buffer with LSP" })
end

return M
