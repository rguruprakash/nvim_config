return {
  -- Snippets engine
  "L3MON4D3/LuaSnip",

  -- snippet sources
  {
    "saadparwaiz1/cmp_luasnip",
    dependencies = "LuaSnip",
  }, -- Snippets source for nvim-cmp,

  {
    "rafamadriz/friendly-snippets",
    dependencies = "LuaSnip",
    config = function()
      require("luasnip.loaders.from_vscode").load()
    end,
  },

  -- completion sources
  "hrsh7th/cmp-nvim-lsp", -- LSP source for nvim-cmp
  "hrsh7th/cmp-buffer",  -- Source for buffer words
  "hrsh7th/cmp-path",    -- Source for path
  "hrsh7th/cmp-nvim-lua", -- Source for nvim-lua

  -- LSP Icon
  "onsails/lspkind.nvim",

  -- Autocompletion plugin
  {
    "hrsh7th/nvim-cmp",
    config = function()
      local has_words_before = function()
        if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then
          return false
        end
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0
            and vim.api.nvim_buf_get_text(0, line - 1, 0, line - 1, col, {})[1]:match("^%s*$") == nil
      end
      vim.cmd([[
        set completeopt=menu,menuone,noselect
      ]])

      local ls = require("luasnip")
      local cmp = require("cmp")
      cmp.setup({
        snippet = {
          expand = function(args)
            ls.lsp_expand(args.body)
          end,
        },
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        experimental = {
          ghost_text = false,
        },
        formatting = {
          format = require("lspkind").cmp_format({
            mode = "symbol_text", -- show only symbol annotations
            maxwidth = 50,   -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
            ellipsis_char = "...", -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
          }),
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-u>"] = cmp.mapping.scroll_docs(-4),
          ["<C-d>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<CR>"] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Insert,
            select = false,
          }),

          ["<Tab>"] = cmp.mapping(
            vim.schedule_wrap(function(fallback)
              if cmp.visible() and has_words_before() then
                cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
              elseif ls.expand_or_jumpable() then
                ls.expand_or_jump()
              else
                fallback()
              end
            end),
            { "i", "s" }
          ),

          ["<S-Tab>"] = cmp.mapping(
            vim.schedule_wrap(function(fallback)
              if cmp.visible() and has_words_before() then
                cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select })
              elseif ls.jumpable(-1) then
                ls.jump(-1)
              else
                fallback()
              end
            end),
            { "i", "s" }
          ),
        }),
        sources = {
          { name = "copilot",                 priority = 1200, max_item_count = 5 },
          { name = "nvim_lsp_signature_help", priority = 1100 },
          { name = "nvim_lsp",                priority = 1000 },
          { name = "luasnip",                 priority = 800 },
          { name = "buffer",                  priority = 700,  max_item_count = 5 },
          { name = "path",                    priority = 600,  max_item_count = 3 },
          { name = "nvim_lua",                priority = 500 },
        },
      })
    end,
  },
}
