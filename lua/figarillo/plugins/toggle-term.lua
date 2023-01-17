require("toggleterm").setup({
	size = function(term)
		if term.direction == "horizontal" then
			return 10
		elseif term.direction == "vertical" then
			return vim.o.columns * 0.4
		end
	end,
	hide_numbers = true,
	start_in_insert = true,
	auto_scroll = true,
	float_opts = {
		border = "curved",
		width = 70,
		height = 40,
		winblend = 3,
	},
	shade_terminals = true,
	shading_factor = 1.5,
	persist_mode = false,
	direction = "horizontal",
})
