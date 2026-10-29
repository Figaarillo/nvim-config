-- Copilot Free via native inline completion (extra `ai.copilot-native`)
-- Sign in once with :LspCopilotSignIn
return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      copilot = {
        keys = {
          {
            "<A-.>",
            function() vim.lsp.inline_completion.get() end,
            mode = "i",
            desc = "Accept Copilot Suggestion",
          },
        },
      },
    },
  },
}
