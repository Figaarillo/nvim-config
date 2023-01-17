-- Load theme
--vim.cmd([[
--try
--  colorscheme onedark
--catch /^Vim\%((\a\+)\)\=:E185/
--  colorscheme everblush
--  set background=dark
--endtry
--]])
function UseColorScheme(color)
	color = color or "onedark"
	vim.cmd.colorscheme(color)
end

UseColorScheme("onedark")
