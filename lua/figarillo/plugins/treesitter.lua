-- nvim-treesitter `main` branch: no more `highlight`/`indent`/`incremental_selection`/`textobjects`
-- modules. LazyVim already provides:
--   * incremental selection -> <C-Space> (flash.nvim treesitter)
--   * textobject moves      -> ]f [f ]c [c ]F [F ]C [C (nvim-treesitter-textobjects)
return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    ensure_installed = {
      "astro",
      "bash",
      "css",
      "cmake",
      "diff",
      "gitignore",
      "html",
      "javascript",
      "jsdoc",
      "lua",
      "luadoc",
      "luap",
      "markdown",
      "markdown_inline",
      "query",
      "regex",
      "scss",
      "sql",
      "svelte",
      "vim",
      "vimdoc",
      "yaml",
    },
  },
  init = function()
    vim.filetype.add({
      extension = {
        mdx = "mdx",
      },
    })
  end,
}
