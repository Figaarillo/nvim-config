local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
	return
end

local snip_status_ok, luasnip = pcall(require, "luasnip")
if not snip_status_ok then
	return
end

require("luasnip/loaders/from_snipmate").lazy_load({ paths = "./snippets/snipmate" })
require("luasnip/loaders/from_vscode").lazy_load()
local compare = require("cmp.config.compare")
-- require("luasnip/loaders/from_vscode").lazy_load({ paths = "./snippets/vscode" })

local kind_icons = {
	Text = "",
	Method = "",
	Function = "",
	Constructor = "",
	Field = "",
	Variable = "",
	Class = "ﴯ",
	Interface = "",
	Module = "",
	Property = "ﰠ",
	Unit = "塞",
	Value = "",
	Enum = "",
	Keyword = "",
	Snippet = "",
	Color = "",
	File = "",
	Reference = "",
	Folder = "",
	EnumMember = "",
	Constant = "",
	Struct = "פּ",
	Event = "",
	Operator = "",
	TypeParameter = "",
}

cmp.setup({
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body) -- For `luasnip` users.
		end,
	},

	mapping = cmp.mapping.preset.insert({
		["<C-k>"] = cmp.mapping.select_prev_item(),
		["<C-j>"] = cmp.mapping.select_next_item(),
		["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1)),
		["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1)),
		["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
		["<C-e>"] = cmp.mapping({
			i = cmp.mapping.abort(),
			c = cmp.mapping.close(),
		}),
		-- Accept currently selected item. If none selected, `select` first item.
		-- Set `select` to `false` to only confirm explicitly selected items.
		["<CR>"] = cmp.mapping.confirm({ select = false }),
		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif luasnip.expandable() then
				luasnip.expand()
			elseif luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			else
				fallback()
			end
		end, {
			"i",
			"s",
		}),
		["<S-Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, {
			"i",
			"s",
		}),
	}),
	formatting = {
		fields = { "kind", "abbr", "menu" }, --order they will be displayed => Icon | Abbreviation | Menu
		format = function(entry, vim_item)
			vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
			vim_item.menu = ({
				buffer = "[Buffer]",
				nvim_lsp = "[LSP]",
				luasnip = "[Snippet]",
				path = "[Path]",
				cmp_tabnine = "[TabNine]",
				emoji = "[Emoji]",
			})[entry.source.name]
			return vim_item
		end,
	},
	sources = {
		{ name = "luasnip", max_item_count = 7 },
		{ name = "nvim_lsp", max_item_count = 7, keyword_length = 1 },
		{ name = "cmp_tabnine", max_item_count = 7, keyword_length = 2 },
		{ name = "buffer", max_item_count = 7, keyword_length = 3 },
		{ name = "path" },
		{ name = "emoji" },
	},
	confirm_opts = {
		behavior = cmp.ConfirmBehavior.Replace,
		select = false,
	},
	window = {
		completion = cmp.config.window.bordered({
			border = "rounded",
			col_offset = -3,
			side_padding = 1,
		}),
		documentation = cmp.config.window.bordered({
			border = "rounded",
			col_offset = -3,
			side_padding = 1,
		}),
	},
	sorting = {
		priority_weight = 1,
		comparators = {
			-- compare.kind,
			compare.sort_text,
		},
	},
	experimental = {
		native_menu = false,
		ghost_text = true,
	},
	performance = {
		trigger_debounce_time = 500,
		throttle = 550,
		fetching_timeout = 80,
	},
})

cmp.setup.cmdline({ "/", "?" }, {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = "buffer" },
	},
})

cmp.setup.cmdline(":", {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = "cmdline" },
	},
	window = {
		completion = cmp.config.window.bordered({
			border = "rounded",
			-- winhighlight = "Normal:Normal,FloatBorder:CmpCompletionBorder,CursorLine:CmpCursorLine,Search:Search",
			col_offset = -3,
			side_padding = 1,
		}),
	},
	formatting = {
		-- fields = { 'abbr' },
		format = function(_, vim_item)
			vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
			return vim_item
		end,
	},
})
