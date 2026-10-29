return {
  "nvimdev/dashboard-nvim",
  event = "VimEnter",
  opts = function(_, opts)
    local logo = [[                                                    
                                                                    
      ████ ██████           █████      ██                     
     ███████████             █████                             
     █████████ ███████████████████ ███   ███████████   
    █████████  ███    █████████████ █████ ██████████████   
   █████████ ██████████ █████████ █████ █████ ████ █████   
 ███████████ ███    ███ █████████ █████ █████ ████ █████  
██████  █████████████████████ ████ █████ █████ ████ ██████ 
                                                                      
                             by figarillo                             ]]

    logo = string.rep("\n", 3) .. logo .. "\n"
    opts.config.header = vim.split(logo, "\n")

    local fileExplorer = function()
      require("oil").open()
    end

    -- stylua: ignore
    opts.config.center = {
      { action = "FzfLua files",                                              desc = " Find file",       icon = " ", key = "f" },
      { action = fileExplorer,                                                desc = " File Browser",    icon = " ", key = "p" },
      { action = "ene | startinsert",                                         desc = " New file",        icon = " ", key = "n" },
      { action = "FzfLua oldfiles",                                           desc = " Recent files",    icon = " ", key = "r" },
      { action = "FzfLua live_grep",                                          desc = " Find text",       icon = " ", key = "g" },
      { action = "FzfLua files cwd=" .. vim.fn.stdpath("config"),             desc = " Config",          icon = " ", key = "c" },
      { action = 'lua require("persistence").load()',                         desc = " Restore Session", icon = " ", key = "s" },
      { action = "LazyExtras",                                                desc = " Lazy Extras",     icon = " ", key = "x" },
      { action = "Lazy",                                                      desc = " Lazy",            icon = "󰒲 ", key = "l" },
      { action = "qa",                                                        desc = " Quit",            icon = " ", key = "q" },
    }

    for _, button in ipairs(opts.config.center) do
      button.desc = button.desc .. string.rep(" ", 43 - #button.desc)
      button.key_format = "  %s"
    end
  end,
}
