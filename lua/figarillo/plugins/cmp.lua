return {
  "hrsh7th/nvim-cmp",
  version = false, -- last release is way too old
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "saadparwaiz1/cmp_luasnip",
    "rafamadriz/friendly-snippets",
    "hrsh7th/cmp-emoji",
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-cmdline",
  },
  opts = function()
    local cmp = require("cmp")
    local luasnip = require("luasnip")
    local compare = require("cmp.config.compare")

    local has_words_before = function()
      unpack = unpack or table.unpack
      local line, col = unpack(vim.api.nvim_win_get_cursor(0))
      return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
    end

    vim.api.nvim_set_hl(0, "CmpGhostText", { link = "Comment", default = true })

    local kind_icons = {
      Text = "󰉿",
      Method = " ",
      Function = "󰊕 ",
      Constructor = " ",
      Field = " ",
      Variable = " ",
      Class = "󰠱 ",
      Interface = " ",
      Module = " ",
      Property = "󰜢 ",
      Unit = "󰑭 ",
      Value = " ",
      Enum = " ",
      Keyword = "󰌋 ",
      Snippet = " ",
      Color = "󰏘 ",
      File = "󰈙 ",
      Reference = " ",
      Folder = "󰉋 ",
      EnumMember = " ",
      Constant = "󰏿 ",
      Struct = " ",
      Event = " ",
      Operator = " ",
      TypeParameter = "  ",
      Misc = " ",
    }

    return {
      completion = {
        completeopt = "menu,menuone,noinsert,noselect",
      },
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      window = {
        completion = cmp.config.window.bordered({
          border = "rounded",
          winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder,CursorLine:Visual,Search:None",
        }),
        documentation = cmp.config.window.bordered({
          border = "rounded",
          winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder,CursorLine:Visual,Search:None",
        }),
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-j>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
        ["<C-k>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
        ["<C-e>"] = cmp.mapping({
          i = cmp.mapping.abort(),
          c = cmp.mapping.close(),
        }),
        ["<CR>"] = cmp.mapping.confirm({ select = false }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        ["<S-CR>"] = cmp.mapping.confirm({
          behavior = cmp.ConfirmBehavior.Replace,
          select = true,
        }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.expandable() then
            luasnip.expand()
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          elseif has_words_before() then
            cmp.complete()
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif vim.snippet.active({ direction = -1 }) then
            vim.schedule(function()
              vim.snippet.jump(-1)
            end)
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { "i", "s" }),
      }),
      formatting = {
        fields = { "kind", "abbr", "menu" }, --order they will be displayed => Icon | Abbreviation | Menu
        format = function(entry, vim_item)
          vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
          vim_item.menu = ({
            nvim_lsp = "[LSP]",
            luasnip = "[Snippet]",
            buffer = "[Buffer]",
            path = "[Path]",
            emoji = "[Emoji]",
          })[entry.source.name]
          return vim_item
        end,
      },
      sources = {
        { name = "nvim_lsp", max_item_count = 10, keyword_length = 1 },
        { name = "luasnip", max_item_count = 10 },
        { name = "buffer", max_item_count = 5, keyword_length = 3 },
        { name = "emoji" },
        { name = "path" },
      },
      confirm_opts = {
        behavior = cmp.ConfirmBehavior.Replace,
        select = false,
      },
      performance = {
        max_view_entries = 20,
        trigger_debounce_time = 500,
        throttle = 550,
        fetching_timeout = 80,
      },
      experimental = {
        ghost_text = {
          hl_group = "CmpGhostText",
        },
      },
      sorting = {
        priority_weight = 1,
        comparators = {
          -- compare.kind,
          compare.sort_text,
        },
      },
    }
  end,
}
