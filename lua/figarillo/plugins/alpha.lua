if true then
  return {}
end

return {
  "goolord/alpha-nvim",
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
    opts.section.header.val = vim.split(logo, "\n", { trimpty = true })
  end,
}
