local status_ok, lspsaga = pcall(require, "lspsaga")
if not status_ok then
	return
end

lspsaga.init_lsp_saga({
	border_style = "rounded",
	code_action_lightbulb = {
		enable = false,
	},
	server_filetype_map = {
		typescript = "typescript",
	},
	rename_in_select = false,
	finder_action_keys = {
		open = "o",
		vsplit = "s",
		split = "i",
		tabe = "t",
		quit = "q",
		scroll_down = "<C-f>",
		scroll_up = "<C-b>", -- quit can be a table
	},
	rename_action_quit = ";",
	-- show symbols in winbar must nightly
	symbol_in_winbar = {
		in_custom = false,
		enable = false,
		separator = "  ",
		show_file = true,
		click_support = false,
	},
})

local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<leader>er", "<Cmd>Lspsaga diagnostic_jump_next<CR>", opts)
vim.keymap.set("n", "K", "<Cmd>Lspsaga hover_doc<CR>", opts)
vim.keymap.set("n", "gd", "<Cmd>Lspsaga lsp_finder<CR>", opts)
vim.keymap.set("i", "<leader>hl", "<Cmd>Lspsaga signature_help<CR>", opts)
vim.keymap.set("n", "gp", "<Cmd>Lspsaga preview_definition<CR>", opts)
vim.keymap.set("n", "gr", "<Cmd>Lspsaga rename<CR>", opts)
