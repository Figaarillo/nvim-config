-- ==================================================================
--                            KEY MAPPING
-- ==================================================================

---@type MappingsTable
local M = {}

-- ======================== Disabled mappings ========================
M.disabled = {
  n = {
      ["<Esc>"] = "",
  }
}

-- ======================== General mappings ========================
M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },

    -- save file
    ["<C-s>"] = { "<Esc>:w<CR>", "save file" },

    --Ctrl - Backspace to delete the previous word
    ["<C-BS>"] = { "<C-W>", "ctrl-backspace to delete the previous word" },

    -- Open cheatsheet
    ["<C-A-k>"] = { "<cmd> NvCheatsheet <CR>", "mapping cheatsheet" },

    -- fast exits
    ["ZZ"] = { "<cmd>Nvdash<CR>", "fast close to go to dashboard" },
    ["ZZZ"] = { "<cmd> q!<CR>", "fast close" },

    -- toggle wrap
    ["<A-z>"] = { "<cmd>set wrap!<CR>", "toggle wrap" },

    -- close current buffer
    ["<leader>w"] = { "<cmd> bdelete!<CR>", "close current buffer" },

    -- toggle autosave
    -- ["<leader>s"] = { ":ASToggle<CR>", "Toggle autosave" },

    -- toggle highlight
    ["<leader>h"] = { ":set hlsearch!<CR>", "toggle highlight" },

    -- Move text up and down in normal mode
    ["M-k"] = { ":m .-2<CR>==", "move current line text to up" },
    ["M-j"] = { ":m .+1<CR>==", "move current line text to down" },
  },

  v = {
    -- Move text up and down in visual mode
    ["M-k"] = { ":m '<-3<CR>gv=gv", "move current line text to up" },
    ["M-j"] = { ":m '>+1<CR>gv=gv", "move current line text to down" },
  },
}

M.comment = {
  plugin = true,

  -- toggle comment
  n = {
    ["<C-_>"] = {
      function()
        require("Comment.api").toggle.linewise.current()
      end,
      "toggle comment",
    },
  },

  i = {
    ["<C-s>"] = { "<Esc>:w<CR>a" },
    ["<C-_>"] = {
      "<Esc><cmd>lua require('Comment.api').toggle.linewise.current()<CR>A ",
      "toggle comment"
    }
  },

  v = {
    ["<C-\\>"] = {
      "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
      "toggle comment",
    },
  },
}
M.nvimtree = {
  n = {
    -- toggle
    ["<C-M-j>"] = { "<cmd> NvimTreeToggle <CR>", "toggle nvimtree" },
  },
}

M.telescope = {
  n = {
    -- find
    ["<C-p>"] = { "<cmd> Telescope buffers <CR>", "find buffers" },

    -- theme switcher
    ["<C-A-u>"] = { "<cmd> Telescope themes <CR>", "nvchad themes" },
  },
}

M.nvterm = {

  n = {
    -- new
    ["<leader>t"] = {
      function()
        require("nvterm.terminal").new "horizontal"
      end,
      "new horizontal term",
    },

    ["<leader>tv"] = {
      function()
        require("nvterm.terminal").new "vertical"
      end,
      "new vertical term",
    },
  },
}
return M
