local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
	return
end

local M = {}

local formatting = null_ls.builtins.formatting
-- local diagnostics = null_ls.builtins.diagnostics

local sources = {
	formatting.prettier.with({
		filetypes = { "css", "html", "javascript", "json", "yaml", "python" },
		prefer_local = "",
		extra_filetypes = { "toml", "solidity" },
		extra_args = { "--single-quote", "--print-width 80", "--arrow-parens avoid" },
	}),
	formatting.black.with({ extra_args = { "--fast" } }),
	formatting.stylua,
	formatting.google_java_format,
}

local group = vim.api.nvim_create_augroup("lsp_format_on_save", { clear = false })
local event = "BufWritePre" -- or "BufWritePost"
local async = event == "BufWritePost"

local on_attach = function(client, bufnr)
	if client.supports_method("textDocument/formatting") then
		vim.keymap.set("n", "<Leader>f", function()
			vim.lsp.buf.format({ bufnr = vim.api.nvim_get_current_buf() })
		end, { buffer = bufnr, desc = "[lsp] format" })

		vim.api.nvim_clear_autocmds({ group = group, buffer = bufnr })
		vim.api.nvim_create_autocmd(event, {
			group = group,
			buffer = bufnr,
			callback = function()
				-- lsp_formatting(bufnr)
				vim.lsp.buf.format({ bufnr = bufnr, async = async })
			end,
		})
	end

	if client.supports_method("textDocument/rangeFormatting") then
		vim.keymap.set("x", "<Leader>f", function()
			vim.lsp.buf.format({ bufnr = vim.api.nvim_get_current_buf() })
		end, { buffer = bufnr, desc = "[lsp] format" })
	end
end

null_ls.setup({
	debug = false,
	sources = sources,
	on_attach = on_attach,
	border = "rounded",
})

function M.list_registered_providers_names(filetype)
	local s = require("null-ls.sources")
	local available_sources = s.get_available(filetype)
	local registered = {}
	for _, source in ipairs(available_sources) do
		for method in pairs(source.methods) do
			registered[method] = registered[method] or {}
			table.insert(registered[method], source.name)
		end
	end
	return registered
end

function M.list_registered_formatters(filetype)
	local registered_providers = M.list_registered_providers_names(filetype)
	local method = null_ls.methods.FORMATTING
	return registered_providers[method] or {}
end

function M.list_registered_linters(filetype)
	local registered_providers = M.list_registered_providers_names(filetype)
	local method = null_ls.methods.DIAGNOSTICS
	return registered_providers[method] or {}
end

return M
