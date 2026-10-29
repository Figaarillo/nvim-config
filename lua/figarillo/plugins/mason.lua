return {
  "mason-org/mason.nvim",
  opts = function(_, opts)
    -- extend (not replace) so LazyVim extras keep their tools
    vim.list_extend(opts.ensure_installed, {
      "stylua",
      "selene",
      "luacheck",
      "shellcheck",
      "shfmt",
      "flake8",
      "tailwindcss-language-server",
      "deno",
      "pyright",
      "css-lsp",
    })
  end,
}
