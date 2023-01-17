local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
	return
end

local colors = {
	red = "#ca1243",
	grey = "#a0a1a7",
	black = "#383a42",
	white = "#f3f3f3",
	light_green = "#83a598",
	orange = "#fe8019",
	green = "#8ec07c",
	bg = "#1A1C23",
}

local status_empty, empty = pcall(require, "lualine.component"):extend()
if not status_empty then
	return
end
function empty:draw(default_highlight)
	self.status = ""
	self.applied_separator = ""
	self:apply_highlights(default_highlight)
	self:apply_section_separators()
	return self.status
end

local function process_sections(sections)
	for name, section in pairs(sections) do
		local left = name:sub(9, 10) < "x"
		for pos = 1, name ~= "lualine_z" and #section or #section - 1 do
			table.insert(section, pos * 2, { empty, color = { fg = colors.bg, bg = colors.bg } })
		end
		for id, comp in ipairs(section) do
			if type(comp) ~= "table" then
				comp = { comp }
				section[id] = comp
			end
			comp.separator = left and { right = "" } or { left = "" }
		end
	end
	return sections
end

local function modified()
	if vim.bo.modified then
		return "+"
	elseif vim.bo.modifiable == false or vim.bo.readonly == true then
		return "-"
	end
	return ""
end

lualine.setup({
	options = {
		theme = "horizon",
		component_separators = "",
		section_separators = { left = "", right = "" },
		disabled_filetypes = {
			"packer",
			"NVimTree",
			"alpha",
			statusline = {},
			winbar = {},
		},
		icons_enabled = true,
		always_divide_middle = true,
	},
	sections = process_sections({
		lualine_a = { "mode" },
		lualine_b = {
			"branch",
			"diff",
			{
				"diagnostics",
				source = { "nvim_lsp" },
				sections = { "error" },
				diagnostics_color = { error = { bg = colors.red, fg = colors.white } },
			},
			{
				"diagnostics",
				source = { "nvim_lsp" },
				sections = { "warn" },
				diagnostics_color = { warn = { bg = colors.orange, fg = colors.white } },
			},
			{ modified, color = { bg = colors.red } },
			{
				"%q",
				cond = function()
					return vim.bo.buftype == "quickfix"
				end,
			},
		},
		lualine_c = {
			{
				"buffers",
				show_filename_only = true, -- Shows shortened relative path when set to false.
				hide_filename_extension = false, -- Hide filename extension when set to true.
				show_modified_status = false, -- Shows indicator when the buffer is modified.
				mode = 0,
				max_length = vim.o.columns * 2 / 3, -- Maximum width of buffers component,

				filetype_names = {
					TelescopePrompt = "Telescope",
					daohboard = "Dashboard",
					packer = "Packer",
					fzf = "FZF",
					alpha = "Alpha",
				}, -- Shows specific buffer name for that filetype ( { `filetype` = `buffer_name`, ... }

				buffers_color = {
					-- active = "lualine_d_normal", -- Color for active buffer.
					-- inactive = "lualine_d_normal", -- Color for inactive buffer.
				},
				symbols = {
					modified = " ●", -- Text to show when the buffer is modified
					alternate_file = "", -- Text to show to identify the alternate file
					directory = "", -- Text to show when the buffer is a directory
				},
			},
		},
		lualine_x = {},
		lualine_y = { { "filetype", colored = true, icon_only = true } },
		lualine_z = { "progress" },
	}),
	inactive_sections = {
		lualine_c = { "%f %y %m" },
		lualine_x = {},
	},
})
