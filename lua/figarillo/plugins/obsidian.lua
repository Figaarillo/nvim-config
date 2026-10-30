return {
  {
    "obsidian-nvim/obsidian.nvim",
    version = "*",
    ft = "markdown",
    cmd = "Obsidian",
    keys = {
      -- <leader>oo / <leader>of belong to oil.nvim
      {
        "<leader>o?",
        function()
          Snacks.win({
            file = vim.fn.stdpath("config") .. "/docs/obsidian-cheatsheet.md",
            width = 0.6,
            height = 0.8,
            border = "rounded",
            title = " Obsidian cheatsheet ",
            wo = { wrap = true, conceallevel = 2 },
            bo = { filetype = "markdown", modifiable = false },
          })
        end,
        desc = "Cheatsheet",
      },
      { "<leader>on", "<cmd>Obsidian new<CR>", desc = "New Note" },
      { "<leader>oN", "<cmd>Obsidian new_from_template<CR>", desc = "New Note from Template" },
      { "<leader>oq", "<cmd>Obsidian quick_switch<CR>", desc = "Quick Switch Note" },
      { "<leader>os", "<cmd>Obsidian search<CR>", desc = "Search Notes (grep)" },
      { "<leader>og", "<cmd>Obsidian tags<CR>", desc = "Tags" },
      { "<leader>ow", "<cmd>Obsidian workspace<CR>", desc = "Switch Workspace" },
      { "<leader>ot", "<cmd>Obsidian today<CR>", desc = "Today's Note" },
      { "<leader>oy", "<cmd>Obsidian yesterday<CR>", desc = "Yesterday's Note" },
      { "<leader>om", "<cmd>Obsidian tomorrow<CR>", desc = "Tomorrow's Note" },
      { "<leader>od", "<cmd>Obsidian dailies<CR>", desc = "Daily Notes" },
      { "<leader>ob", "<cmd>Obsidian backlinks<CR>", desc = "Backlinks", ft = "markdown" },
      { "<leader>ol", "<cmd>Obsidian links<CR>", desc = "Links in Note", ft = "markdown" },
      { "<leader>oc", "<cmd>Obsidian toc<CR>", desc = "Table of Contents", ft = "markdown" },
      { "<leader>oT", "<cmd>Obsidian template<CR>", desc = "Insert Template", ft = "markdown" },
      { "<leader>op", "<cmd>Obsidian paste_img<CR>", desc = "Paste Image", ft = "markdown" },
      { "<leader>or", "<cmd>Obsidian rename<CR>", desc = "Rename Note", ft = "markdown" },
      { "<leader>ox", "<cmd>Obsidian toggle_checkbox<CR>", desc = "Toggle Checkbox", ft = "markdown" },
      { "<leader>oe", ":Obsidian extract_note<CR>", mode = "v", desc = "Extract to New Note", ft = "markdown" },
      { "<leader>ok", ":Obsidian link<CR>", mode = "v", desc = "Link Selection", ft = "markdown" },
      { "<leader>oK", ":Obsidian link_new<CR>", mode = "v", desc = "Link Selection to New Note", ft = "markdown" },
    },
    ---@module 'obsidian'
    ---@type obsidian.config
    opts = {
      legacy_commands = false,
      workspaces = {
        { name = "ingenieria", path = "~/Documents/Ingenieria" },
        { name = "licensia", path = "~/Documents/Licensia" },
        { name = "english-platzi", path = "~/Documents/English/English - Platzi" },
        { name = "ingles-progresar", path = "~/Documents/English/Ingles PROGRESAR" },
      },
      picker = { name = "fzf-lua" },
      -- render-markdown (lang.markdown extra) already handles rendering
      ui = { enable = false },
      -- keep human-readable filenames instead of random zettel ids
      note_id_func = function(title)
        if title ~= nil and title ~= "" then
          return title
        end
        return tostring(os.time())
      end,
    },
  },
  {
    "folke/which-key.nvim",
    opts = {
      spec = {
        { "<leader>o", group = "obsidian/oil", icon = "󱞁" },
      },
    },
  },
}
