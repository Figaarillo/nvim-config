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
