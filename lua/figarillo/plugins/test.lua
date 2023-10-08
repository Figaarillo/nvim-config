if true then
  return {}
end

return {
  {
    "nvim-neotest/neotest",
    dependencies = {
      "haydenmeade/neotest-jest",
      "marilari88/neotest-vitest",
    },
    keys = {
      {
        "<leader>tl",
        function()
          require("neotest").run.run_last()
        end,
        desc = "Run Last Test",
      },
      {
        "<leader>tL",
        function()
          require("neotest").run.run_last({ strategy = "dap" })
        end,
        desc = "Debug Last Test",
      },
      {
        "<leader>tw",
        "<cmd>lua require('neotest').run.run({ jestCommand = 'jest --watch ' })<cr>",
        desc = "Run Watch",
      },
    },
    opts = function(_, opts)
      table.insert(
        opts.adapters,
        require("neotest-jest")({
          jestCommand = "npm test --",
          jestConfigFile = "custom.jest.config.ts",
          env = { CI = true },
          cwd = function()
            return vim.fn.getcwd()
          end,
        })
      )
      table.insert(opts.adapters, require("neotest-vitest"))
    end,
  },
}
-- return {
--   {
--     { "nvim-neotest/neotest-plenary" },
--     {
--       "nvim-neotest/neotest",
--       optional = true,
--       lazy = true,
--       dependencies = {
--         "rouge8/neotest-rust",
--         "nvim-neotest/neotest-go",
--         "haydenmeade/neotest-jest",
--         "marilari88/neotest-vitest",
--       },
--       opts = {
--         -- Can be a list of adapters like what neotest expects,
--         -- or a list of adapter names,
--         -- or a table of adapter names, mapped to adapter configs.
--         -- The adapter will then be automatically loaded with the config.
--         adapters = {
--           adapters = { "neotest-plenary" },
--           ["neotest-rust"] = {},
--           ["neotest-go"] = {
--             -- Here we can set options for neotest-go, e.g.
--             -- args = { "-tags=integration" }
--           },
--           ["neotest-python"] = {
--             -- Here you can specify the settings for the adapter, i.e.
--             -- runner = "pytest",
--             -- python = ".venv/bin/python",
--           },
--         },
--         status = { virtual_text = true },
--         output = { open_on_run = true },
--         quickfix = {
--           open = function()
--             if require("lazyvim.util").has("trouble.nvim") then
--               vim.cmd("Trouble quickfix")
--             else
--               vim.cmd("copen")
--             end
--           end,
--         },
--       },
--       config = function(_, opts)
--         table.insert(
--           opts.adapters,
--           require("neotest-jest")({
--             jestCommand = "npm test --",
--             jestConfigFile = "custom.jest.config.ts",
--             env = { CI = true },
--             cwd = function()
--               return vim.fn.getcwd()
--             end,
--           })
--         )
--         table.insert(opts.adapters, require("neotest-vitest"))
--         local neotest_ns = vim.api.nvim_create_namespace("neotest")
--         vim.diagnostic.config({
--           virtual_text = {
--             format = function(diagnostic)
--               -- Replace newline and tab characters with space for more compact diagnostics
--               local message = diagnostic.message:gsub("\n", " "):gsub("\t", " "):gsub("%s+", " "):gsub("^%s+", "")
--               return message
--             end,
--           },
--         }, neotest_ns)
--       end,
--     -- stylua: ignore
--     keys = {
--       { "<leader>tl", function() require("neotest").run.run_last() end, desc = "Run Last Test", },
--       { "<leader>tL", function() require("neotest").run.run_last({ strategy = "dap" }) end, desc = "Debug Last Test",}
--       { "<leader>tw", "<cmd>lua require('neotest').run.run({ jestCommand = 'jest --watch ' })<cr>", desc = "Run Watch", },
--       { "<leader>tt", function() require("neotest").run.run(vim.fn.expand("%")) end, desc = "Run File" },
--       { "<leader>tT", function() require("neotest").run.run(vim.loop.cwd()) end, desc = "Run All Test Files" },
--       { "<leader>tr", function() require("neotest").run.run() end, desc = "Run Nearest" },
--       { "<leader>ts", function() require("neotest").summary.toggle() end, desc = "Toggle Summary" },
--       { "<leader>to", function() require("neotest").output.open({ enter = true, auto_close = true }) end, desc = "Show Output" },
--       { "<leader>tO", function() require("neotest").output_panel.toggle() end, desc = "Toggle Output Panel" },
--       { "<leader>tS", function() require("neotest").run.stop() end, desc = "Stop" },
--     },
--     },
--   },
--   {
--     "folke/which-key.nvim",
--     optional = true,
--     opts = {
--       defaults = {
--         ["<leader>t"] = { name = "+test" },
--       },
--     },
--   },
--   {
--     "mfussenegger/nvim-dap",
--     optional = true,
--     dependencies = {
--       "mfussenegger/nvim-dap-python",
--     },
--     config = function()
--       local path = require("mason-registry").get_package("debugpy"):get_install_path()
--       require("dap-python").setup(path .. "/venv/bin/python")
--     end,
--     -- stylua: ignore
--     keys = {
--       { "<leader>td", function() require("neotest").run.run({strategy = "dap"}) end, desc = "Debug Nearest" },
--       { "<leader>dPt", function() require('dap-python').test_method() end, desc = "Debug Method" },
--       { "<leader>dPc", function() require('dap-python').test_class() end, desc = "Debug Class" },
--     },
--   },
--   {
--     "linux-cultist/venv-selector.nvim",
--     cmd = "VenvSelect",
--     opts = function(_, opts)
--       if require("lazyvim.util").has("nvim-dap-python") then
--         opts.dap_enabled = true
--       end
--       return vim.tbl_deep_extend("force", opts, {
--         name = {
--           "venv",
--           ".venv",
--           "env",
--           ".env",
--         },
--       })
--     end,
--     keys = { { "<leader>cv", "<cmd>:VenvSelect<cr>", desc = "Select VirtualEnv" } },
--   },
-- }
