local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
	return
end

local M = {}

local formatting = null_ls.builtins.formatting
local code_actions = null_ls.builtins.code_actions
local diagnostics = null_ls.builtins.diagnostics

local sources = {
	formatting.prettierd,
	formatting.black.with({ extra_args = { "--fast" } }),
	formatting.stylua,
	formatting.google_java_format,
	code_actions.eslint,
	diagnostics.eslint,
}

null_ls.setup({
	debug = false,
	sources = sources,
	on_attach = require("figarillo.plugins.lsp.handlers").on_attach,
	border = "rounded",
})

function M.list_registered_providers_names(filetype)
	local s = require("null-ls.sources")
	local available_sources = s.get_available(filetype)
	local registered = {}
	for _, source in ipairs(available_sources) do
		for method in pairs(source.methods) do
			registered[method] = registered[method] or {}
			table.insert(registered[method], source.name)
		end
	end
	return registered
end

function M.list_registered_formatters(filetype)
	local registered_providers = M.list_registered_providers_names(filetype)
	local method = null_ls.methods.FORMATTING
	return registered_providers[method] or {}
end

function M.list_registered_linters(filetype)
	local registered_providers = M.list_registered_providers_names(filetype)
	local method = null_ls.methods.DIAGNOSTICS
	return registered_providers[method] or {}
end

return M
