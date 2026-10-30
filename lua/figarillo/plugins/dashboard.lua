-- snacks.dashboard: snacks is already loaded, so this costs no extra plugin.
-- Layout adapts to the window: logo only if tall enough, second pane only if wide enough.

-- Synthwave sun. Symmetric with even widths, so snacks' per-line centering keeps it round.
-- stylua: ignore
local art = {
  "▄▄▄▄▄▄▄▄▄▄",
  "▄██████████████████▄",
  "▄██████████████████████▄",
  "████████████████████████████",
  "▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀",
  "██████████████████████████",
  "▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀",
}
local horizon = string.rep("═", 36)

-- Sun gradient from the active colorscheme (Type -> Constant -> Error: yellow -> peach -> pink
-- in catppuccin), so it follows theme switches instead of hardcoding colors
local function gradient_hl()
  local normal = vim.api.nvim_get_hl(0, { name = "Normal", link = false }).fg or 0xcdd6f4
  local stops = {}
  for _, group in ipairs({ "Type", "Constant", "Error" }) do
    stops[#stops + 1] = vim.api.nvim_get_hl(0, { name = group, link = false }).fg or normal
  end
  local function mix(a, b, t)
    local c = 0
    for shift = 16, 0, -8 do
      local x, y = bit.band(bit.rshift(a, shift), 0xff), bit.band(bit.rshift(b, shift), 0xff)
      c = c + bit.lshift(math.floor(x + (y - x) * t + 0.5), shift)
    end
    return c
  end
  for i = 1, #art do
    local pos = (i - 1) / (#art - 1) * (#stops - 1)
    local k = math.min(math.floor(pos), #stops - 2)
    vim.api.nvim_set_hl(0, "FigDashArt" .. i, { fg = mix(stops[k + 1], stops[k + 2], pos - k), bold = true })
  end
end

local days = { "domingo", "lunes", "martes", "miércoles", "jueves", "viernes", "sábado" }

local function subtitle()
  local hour = tonumber(os.date("%H"))
  local salute = (hour >= 6 and hour < 13) and "buen día" or (hour >= 13 and hour < 20) and "buenas tardes" or "buenas noches"
  return ("%s, %s %s"):format(salute, days[tonumber(os.date("%w")) + 1], os.date("%d/%m"))
end

-- "name  parent/" instead of snacks' pathshorten (~/D/I/4/R/R/...), unreadable in deep vaults
local function format_file(item, ctx)
  local name = vim.fs.basename(item.file)
  local dir = vim.fs.dirname(item.file)
  -- Obsidian often nests a note in a folder of the same name (PDU/PDU.md)
  if vim.fs.basename(dir) == name:gsub("%.md$", "") then
    dir = vim.fs.dirname(dir)
  end
  local parent = vim.fs.basename(dir)
  local room = ctx.width - vim.api.nvim_strwidth(name) - 2
  if room < 4 then
    return { { name, hl = "file" } }
  end
  if vim.api.nvim_strwidth(parent) > room then
    parent = vim.fn.strcharpart(parent, 0, room - 1) .. "…"
  end
  return { { name, hl = "file" }, { "  " .. parent, hl = "dir" } }
end

local notes_dir = vim.fn.expand("~/Documents")

local function is_note(file)
  return vim.startswith(file, notes_dir) and file:match("%.md$") ~= nil
end

local pane_width, pane_gap = 60, 6

-- room the whole pane needs: sun + horizon/title/greeting (3) + paddings (5) + 11 keys + startup (2)
local function tall()
  return vim.o.lines >= #art + 21
end

local function wide()
  return vim.o.columns >= pane_width * 2 + pane_gap
end

-- header built line by line so each row gets its own gradient color
local function header()
  if not tall() then
    return nil
  end
  gradient_hl()
  local section = { gap = 0, padding = 2 }
  local function line(text, hl, extra)
    section[#section + 1] = vim.tbl_extend("force", { text = { { text, hl = hl } }, align = "center" }, extra or {})
  end
  for i, row in ipairs(art) do
    line(row, "FigDashArt" .. i)
  end
  line(horizon, "Keyword")
  line("n e o v i m  ·  figarillo", "Special", { padding = { 0, 1 } })
  line(subtitle(), "Comment")
  return section
end

local function obsidian_vault()
  local workspaces = LazyVim.opts("obsidian.nvim").workspaces or {}
  vim.ui.select(workspaces, {
    prompt = "Obsidian vault",
    format_item = function(ws) return ws.name end,
  }, function(ws)
    if not ws then return end
    vim.cmd("Obsidian workspace " .. ws.name)
    vim.cmd("Obsidian quick_switch")
  end)
end

return {
  "folke/snacks.nvim",
  opts = {
    dashboard = {
      width = pane_width,
      pane_gap = pane_gap,
      formats = { file = format_file },
      preset = {
        -- icons as escapes so copy-paste can't strip the Nerd Font glyphs
        -- stylua: ignore
        keys = {
          { icon = "\u{f1781} ", key = "o", desc = "Obsidian",        action = obsidian_vault },
          { icon = "\u{f15c} ",  key = "f", desc = "Find File",       action = ":FzfLua files" },
          { icon = "\u{f07c} ",  key = "p", desc = "File Browser",    action = function() require("oil").open() end },
          { icon = "\u{f0fe} ",  key = "n", desc = "New File",        action = ":ene | startinsert" },
          { icon = "\u{f1da} ",  key = "r", desc = "Recent Files",    action = ":FzfLua oldfiles" },
          { icon = "\u{f002} ",  key = "g", desc = "Find Text",       action = ":FzfLua live_grep" },
          { icon = "\u{f013} ",  key = "c", desc = "Config",          action = ":FzfLua files cwd=" .. vim.fn.stdpath("config") },
          { icon = "\u{f021} ",  key = "s", desc = "Restore Session", section = "session" },
          { icon = "\u{f12e} ",  key = "x", desc = "Lazy Extras",     action = ":LazyExtras" },
          { icon = "\u{f04b2} ", key = "l", desc = "Lazy",            action = ":Lazy" },
          { icon = "\u{f011} ",  key = "q", desc = "Quit",            action = ":qa" },
        },
      },
      sections = {
        header,
        { section = "keys", gap = 0, padding = 1 },
        { section = "startup" },
        {
          pane = 2,
          enabled = wide,
          icon = "\u{f1781} ",
          title = "Recent Notes",
          section = "recent_files",
          filter = is_note,
          limit = 5,
          indent = 2,
          padding = 1,
        },
        {
          pane = 2,
          enabled = wide,
          icon = "\u{f1da} ",
          title = "Recent Files",
          section = "recent_files",
          filter = function(file) return not is_note(file) end,
          limit = 5,
          indent = 2,
          padding = 1,
        },
        {
          pane = 2,
          enabled = wide,
          icon = "\u{f07b} ",
          title = "Projects",
          section = "projects",
          limit = 4,
          indent = 2,
          padding = 1,
        },
      },
    },
  },
}
