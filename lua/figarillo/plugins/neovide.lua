---@diagnostic disable: undefined-global
vim.cmd([[
	if exists("g:neovide")
		set guifont=Operator\ Mono\ Lig\ Book:h4.5
		" set guifont=Cascadia\ Code:h4
		let g:neovide_scale_factor = 1.0
		let g:neovide_cursor_vfx_mode = "pixiedust"
		let g:neovide_remember_window_size = v:true
    let g:neovide_transparency = 0.95
    let g:neovide_background_color = '#0B0E14'
	endif
]])
