local cmd = vim.cmd

cmd([[highlight IndentBlanklineIndent1 guifg=#8c1eff gui=nocombine]])
cmd([[highlight IndentBlanklineIndent2 guifg=#f222ff gui=nocombine]])
cmd([[highlight IndentBlanklineIndent3 guifg=#ff2975 gui=nocombine]])
cmd([[highlight IndentBlanklineIndent4 guifg=#ff901f gui=nocombine]])
cmd([[highlight IndentBlanklineIndent5 guifg=#ffd319 gui=nocombine]])
cmd([[highlight IndentBlanklineIndent6 guifg=#ff2975 gui=nocombine]])
cmd([[highlight IndentBlanklineIndent7 guifg=#f222ff gui=nocombine]])

local options = {
	show_current_context = false,
	show_current_context_start = false,
	space_char_blankline = " ",
	char_highlight_list = {
		"IndentBlanklineIndent1",
		"IndentBlanklineIndent2",
		"IndentBlanklineIndent3",
		"IndentBlanklineIndent4",
		"IndentBlanklineIndent5",
		"IndentBlanklineIndent6",
	},
}

vim.opt.list = true

return optoins
