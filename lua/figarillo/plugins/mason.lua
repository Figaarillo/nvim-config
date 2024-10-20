return {
  "williamboman/mason.nvim",
  opts = function(_, opts)
    opts.ensure_installed = {
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
    }
  end,
}
