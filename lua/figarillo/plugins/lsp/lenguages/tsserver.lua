local status_ok, nvim_lsp = pcall(require, "lspconfig")
if not status_ok then
	return
end

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

nvim_lsp.tsserver.setup({
	on_attach = on_attach,
	filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
	cmd = { "typescript-language-server", "--stdio" },
	root_dir = function()
		return vim.loop.cwd()
	end, -- run lsp for javascript in any directory
})
