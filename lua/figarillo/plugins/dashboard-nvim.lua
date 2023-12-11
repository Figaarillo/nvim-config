return {
  "nvimdev/dashboard-nvim",
  event = "VimEnter",
  opts = function(_, opts)
    local logo = [[
███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝
                                     by figarillo
    ]]

    logo = string.rep("\n", 8) .. logo .. "\n\n"
    opts.config.header = vim.split(logo, "\n")

    local fileExplorer = function()
      local function telescope_buffer_dir()
        return vim.fn.expand("%:p:h")
      end

      require("telescope").extensions.file_browser.file_browser({
        path = "%:p:h",
        cwd = telescope_buffer_dir(),
        respect_gitignore = false,
        hidden = true,
        grouped = true,
        previewer = false,
        initial_mode = "normal",
        layout_config = { height = 40 },
      })
    end

    -- stylua: ignore
    opts.config.center = {
      { action = "Telescope find_files",                                     desc = " Find file",       icon = " ", key = "f" },
      { action = fileExplorer,                                               desc = " File Browser",    icon = " ", key = "p" },
      { action = "ene | startinsert",                                        desc = " New file",        icon = " ", key = "n" },
      { action = "Telescope oldfiles",                                       desc = " Recent files",    icon = " ", key = "r" },
      { action = "Telescope live_grep",                                      desc = " Find text",       icon = " ", key = "g" },
      { action = [[lua require("lazyvim.util").telescope.config_files()()]], desc = " Config",          icon = " ", key = "c" },
      { action = 'lua require("persistence").load()',                        desc = " Restore Session", icon = " ", key = "s" },
      { action = "LazyExtras",                                               desc = " Lazy Extras",     icon = " ", key = "x" },
      { action = "Lazy",                                                     desc = " Lazy",            icon = "󰒲 ", key = "l" },
      { action = "qa",                                                       desc = " Quit",            icon = " ", key = "q" },
    }

    for _, button in ipairs(opts.config.center) do
      button.desc = button.desc .. string.rep(" ", 43 - #button.desc)
      button.key_format = "  %s"
    end
  end,
}
