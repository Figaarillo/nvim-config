local status_ok, onedark = pcall(require, "onedark")
if not status_ok then
	return
end

onedark.setup({
	-- Main options --
	style = "dark", -- Default theme style. Choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
	transparent = true, -- Show/hide background
	term_colors = false, -- Change terminal color as per the selected theme style
	ending_tildes = false, -- Show the end-of-buffer tildes. By default they are hidden
	cmp_itemkind_reverse = false, -- reverse item kind highlights in cmp menu

	-- toggle theme style ---
	toggle_style_key = nil, -- keybind to toggle theme style. Leave it nil to disable it, or set it to a string, for example "<leader>ts"
	toggle_style_list = { "dark", "darker", "cool", "deep", "warm", "warmer", "light" }, -- List of styles to toggle between

	-- Change code style ---
	-- Options are italic, bold, underline, none
	-- You can configure multiple style with comma seperated, For e.g., keywords = 'italic,bold'
	code_style = {
		comments = "italic",
		keywords = "bold",
		functions = "italic",
		strings = "none",
		variables = "none",
	},

	-- Lualine options --
	lualine = {
		transparent = false, -- lualine center bar transparency
	},

	-- Custom Highlights --
	colors = {
		black = "#181a1f",
		bg0 = "#282c34",
		bg1 = "#31353f",
		bg2 = "#393f4a",
		bg3 = "#3b3f4c",
		bg_d = "#21252b",
		bg_blue = "#429fec",
		bg_yellow = "#ebd09c",
		fg = "#abb2bf",
		purple = "#ad45b6",
		green = "#74c060",
		orange = "#cb8e55",
		blue = "#4ba4ec",
		yellow = "#e5c07b",
		cyan = "#56b6c2",
		red = "#e34856",
		grey = "#5c6370",
		light_grey = "#848b98",
		dark_cyan = "#2b6f77",
		dark_red = "#913636",
		dark_yellow = "#8b631b",
		dark_purple = "#833b97",
		diff_add = "#31392b",
		diff_delete = "#382b2c",
		diff_change = "#1c3448",
		diff_text = "#2c5372",
	}, -- Override default colors
	highlights = {}, -- Override highlight groups

	-- Plugins Config --
	diagnostics = {
		darker = true, -- darker colors for diagnostic
		undercurl = true, -- use undercurl instead of underline for diagnostics
		background = true, -- use background color for virtual text
	},
})

--[[
dark = {
		black = "#181a1f",
		bg0 = "#282c34",
		bg1 = "#31353f",
		bg2 = "#393f4a",
		bg3 = "#3b3f4c",
		bg_d = "#21252b",
		bg_blue = "#73b8f1",
		bg_yellow = "#ebd09c",
		fg = "#abb2bf",
		purple = "#a94bb1",
		green = "#98c379",
		orange = "#d19a66",
		blue = "#429feb",
		yellow = "#e5c07b",
		cyan = "#2bbac5",
		red = "##F44747",
		grey = "#5c6370",
		light_grey = "#848b98",
		dark_cyan = "#2b6f77",
		dark_red = "#993939",
		dark_yellow = "#93691d",
		dark_purple = "#8a3fa0",
		diff_add = "#31392b",
		diff_delete = "#382b2c",
		diff_change = "#1c3448",
		diff_text = "#2c5372",
	}--]]
