local status_ok, rest = pcall(require, "rest-nvim")
if not status_ok then
	return
end

rest.setup({
	result_split_horizontal = false, -- Open request results in a horizontal split
	result_split_in_place = false, -- Keep the http file buffer above|left when split horizontal|vertical
	skip_ssl_verification = false, -- Skip SSL verification, useful for unknown certificates
	encode_url = true, -- Encode URL before making request
	-- Highlight request on run
	highlight = {
		enabled = true,
		timeout = 150,
	},
	result = {
		show_url = true, -- toggle showing URL, HTTP info, headers at top the of result window
		show_http_info = true,
		show_headers = true,
		-- executables or functions for formatting response body [optional]
		-- set them to nil if you want to disable them
		formatters = {
			json = "jq",
			html = function(body)
        -- stylua: ignore
        return vim.fn.system({
          "tidy", "-i", "-q",
          "--tidy-mark", "no",
          "--show-body-only", "auto",
          "--show-errors", "0",
          "--show-warnings", "0",
          "-",
        }, body):gsub("\n$", "")
			end,
		},
	},
	-- Jump to request line on run
	jump_to_request = false,
	env_file = ".env",
	custom_dynamic_variables = {},
	yank_dry_run = true,
})
