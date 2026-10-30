return {
  {
    "mfussenegger/nvim-lint",
    opts = {
      linters = {
        -- the lang.markdown extra uses markdownlint-cli2 (not markdownlint),
        -- which takes rules from a config file instead of --disable flags
        ["markdownlint-cli2"] = {
          args = { "--config", vim.fn.stdpath("config") .. "/.markdownlint.yaml", "-" },
          -- lint docs, not notes: only inside a git repo, and never inside an
          -- Obsidian vault (some vaults are versioned with git too)
          condition = function(ctx)
            return vim.fs.root(ctx.filename, ".git") ~= nil and vim.fs.root(ctx.filename, ".obsidian") == nil
          end,
        },
      },
    },
  },
}
