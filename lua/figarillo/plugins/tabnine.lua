local tabnine = require("cmp_tabnine.config")

tabnine.setup({
	max_lines = 1000,
	max_num_results = 10,
	sort = true,
	run_on_every_keystroke = true,
	snippet_placeholder = "..",
	ignored_file_types = {
		html = true,
		markdown = true,
		txt = true,
	},
	show_prediction_strength = false,
})
