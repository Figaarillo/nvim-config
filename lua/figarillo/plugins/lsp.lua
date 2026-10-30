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
        -- English grammar checker, only for the English Obsidian vaults
        -- (it is English-only: Spanish notes would be all red)
        harper_ls = {
          filetypes = { "markdown" },
          root_dir = function(bufnr, on_dir)
            local path = vim.api.nvim_buf_get_name(bufnr)
            local vault = vim.fn.expand("~/Documents/English/")
            if vim.startswith(path, vault) then
              on_dir(vim.fs.root(bufnr, ".obsidian") or vault)
            end
          end,
          settings = {
            ["harper-ls"] = {
              linters = { SentenceCapitalization = false, SpellCheck = true },
            },
          },
        },
      },
    },
  },
}
