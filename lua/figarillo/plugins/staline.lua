local status_ok, staline = pcall(require, "staline")
if not status_ok then
	return
end

staline.setup({
	defaults = {
		expand_null_ls = false, -- This expands out all the null-ls sources to be shown
		left_separator = "",
		right_separator = "",
		full_path = false,
		line_column = "並%p%% ", -- `:h stl` to see all flags.

		fg = "#3B2733", -- Foreground text color.
		bg = "none", -- Default background is transparent.
		inactive_color = "#303030",
		inactive_bgcolor = "none",
		true_colors = true, -- true lsp colors.
		font_active = "bold,italic", -- "bold", "italic", "bold,italic", etc

		mod_symbol = "  ",
		lsp_client_symbol = " ",
		branch_symbol = " ",
		cool_symbol = " ", -- Change this to override default OS icon.
		null_ls_symbol = "", -- A symbol to indicate that a source is coming from null-ls
	},
	mode_colors = {
		n = "#E95678",
		c = "#F43E5C",
		-- n = "#2bbb4f",
		i = "#986fec",
		-- c = "#e27d60",
		v = "#4799eb", -- etc..
	},
	mode_icons = {
		n = " ",
		i = " ",
		c = " ",
		v = " ", -- etc..
	},
	sections = {
		left = { "- ", "-mode", "-branch", "left_sep_double" },
		mid = { "file_name" },
		right = { "lsp", "right_sep_double", "-line_column" },
	},
	special_table = {
		NvimTree = { "NvimTree", " " },
		packer = { "Packer", " " }, -- etc
	},
	lsp_symbols = {
		Error = " ",
		Info = " ",
		Warn = " ",
		Hint = "",
	},
})
