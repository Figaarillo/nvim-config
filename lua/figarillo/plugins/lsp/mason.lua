local status_ok, mason = pcall(require, "mason")
if not status_ok then
	return
end

local mason_lspconfig_status_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspconfig_status_ok then
	return
end

local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
	return
end

require("lspconfig.ui.windows").default_options.border = "rounded"

local servers = {
	"sumneko_lua", -- Lua
	"pyright", -- Python
	"jsonls", --  JSON
	"tsserver", -- JavaScript / TypeScript
	"emmet_ls", -- Emmet
	"cssls", -- CSS
	"jdtls", -- Java
	"intelephense",
	-- "gopls", -- GO
}

mason.setup({
	ui = {
		border = "single",
		icons = {
			package_installed = "✓",
			package_pending = "",
			package_uninstalled = "➜",
		},
	},
})

mason_lspconfig.setup({
	ensure_installed = servers,
})

mason_lspconfig.setup_handlers({
	function(server_name)
		local opts = {
			on_attach = require("figarillo.plugins.lsp.handlers").on_attach,
			capabilities = require("figarillo.plugins.lsp.handlers").capabilities,
		}

		local require_ok, server = pcall(require, "figarillo.plugins.lsp.settings." .. server_name)
		if require_ok then
			opts = vim.tbl_deep_extend("force", server, opts)
		end

		lspconfig[server_name].setup(opts)
	end,
})
