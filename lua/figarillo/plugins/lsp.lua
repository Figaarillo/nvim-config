return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      -- off by default (costly on big TS/Go files), toggle with <leader>uh
      inlay_hints = { enabled = false },
      servers = {
        lua_ls = {
          settings = {
            Lua = {
              hint = { enabled = true },
            },
          },
        },
      },
    },
  },
}
