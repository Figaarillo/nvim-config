local options = {
  ensure_installed = { "lua" },

  highlight = {
    enable = true,
    use_languagetree = true,
  },
  rainbow = {
		enable = true,
		extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
		max_file_lines = nil, -- Do not enable for files with more than n lines, int
		colors = {
			"#8c1eff",
			"#f222ff",
			"#ff2975",
			"#ff901f",
			"#ffd319",
			"#ff2975",
			"#f222ff",
		},
	},
	indent = { enable = true, disable = { "yaml" } },
}

return options
