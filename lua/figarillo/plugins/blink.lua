return {
  "saghen/blink.cmp",
  opts = {
    completion = {
      ghost_text = { enabled = false },
    },
    sources = {
      providers = {
        snippets = {
          opts = {
            -- reuse javascript snippets in typescript files
            extended_filetypes = {
              typescript = { "javascript" },
              typescriptreact = { "javascript" },
            },
          },
        },
      },
    },
  },
}
