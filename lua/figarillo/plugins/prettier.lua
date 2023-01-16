local status_ok, prettier = pcall(require, "prettier")
if not status_ok then
	return
end

prettier.setup({
	bin = "prettier",
	filetypes = {
		"css",
		"graphql",
		"html",
		"javascript",
		"javascriptreact",
		"json",
		"less",
		"markdown",
		"scss",
		"typescript",
		"typescriptreact",
	},
	["null-ls"] = {
		condition = function()
			return prettier.config_exists({
				-- if `false`, skips checking `package.json` for `"prettier"` key
				check_package_json = true,
			})
		end,
		runtime_condition = function(params)
			-- return false to skip running prettier
			return true
		end,
		timeout = 5000,
	},
	cli_options = {
		arrow_parens = "avoid",
		bracket_spacing = true,
		bracket_same_line = false,
		embedded_language_formatting = "auto",
		html_whitespace_sensitivity = "css",
		jsx_bracket_same_line = true,
		jsx_single_quote = false,
		print_width = 80,
		prose_wrap = "preserve",
		quote_props = "as-needed",
		semi = true,
		single_attribute_per_line = false,
		single_quote = true,
		tab_width = 2,
		trailing_comma = "es5",
		use_tabs = false,
		vue_indent_script_and_style = false,
	},
	config_precedence = "prefer-file",
})
