vim.diagnostic.config({
  float = { border = "single" },
  virtual_text = false,
})

local on_attach = function(client, bufnr)
  local opts = { noremap = true, silent = true }
  vim.keymap.set("n", "<space>e", require("telescope.builtin").diagnostics, opts)
  vim.keymap.set("n", "<leader>e", function()
    vim.diagnostic.open_float({
      source = true,
    })
  end, opts)

  -- Enable completion triggered by <c-x><c-o>
  local builtin = require("telescope.builtin")
  vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
  vim.keymap.set("n", "gd", function()
    builtin.lsp_definitions({ show_line = false })
  end, bufopts)
  vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
  vim.keymap.set("n", "gi", function()
    builtin.lsp_implementations({ show_line = false })
  end, bufopts)
  vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set("n", "<space>wl", function()
    vim.notify(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set("n", "<space>d", function()
    builtin.lsp_type_definitions({ show_line = false })
  end, bufopts)
  vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, bufopts)
  vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, bufopts)
  vim.keymap.set("n", "<space>oi", function()
    local params = {
      command = "_typescript.organizeImports",
      arguments = { vim.api.nvim_buf_get_name(0) },
      title = "",
    }
    vim.lsp.buf.execute_command(params)
  end)
  vim.keymap.set("n", "gr", function()
    builtin.lsp_references({ show_line = false })
  end, {})
  vim.keymap.set({ "n", "v" }, "<space>f", function()
    local clients = vim.lsp.get_clients({ bufnr = bufnr })
    local formatters = {}

    for _, c in pairs(clients) do
      if c.server_capabilities.documentFormattingProvider then
        table.insert(formatters, c.name)
      end
    end

    if #formatters > 1 then
      vim.ui.select(formatters, { prompt = "Select a formatter" }, function(_, choice)
        if not choice then
          print("No formatter selected")
          return
        end

        local formatter = formatters[choice]
        vim.lsp.buf.format({ async = true, name = formatter })
      end)
    else
      vim.lsp.buf.format({ async = true, name = formatters[1] })
    end
  end, bufopts)

  if client.server_capabilities.documentHighlightProvider then
    vim.cmd([[
      autocmd CursorHold  <buffer> lua vim.lsp.buf.document_highlight()
      autocmd CursorHoldI <buffer> lua vim.lsp.buf.document_highlight()
      autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
    ]])
  end

  if client.server_capabilities.inlayHintProvider then
    vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
  end
end

local signs = { Error = "󰅚 ", Warn = "󰀪 ", Hint = "󰌶 ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

return {
  {
    "neovim/nvim-lspconfig",
    dependencies = { "hrsh7th/nvim-cmp", "folke/neodev.nvim" },
    config = function()
      require("neodev").setup()
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities) -- from nvim-cmp plugin
      capabilities.textDocument.foldingRange = {
        dynamicRegistration = false,
        lineFoldingOnly = true,
      }

      require("lspconfig").ts_ls.setup({
        on_attach = on_attach,
        capabilities = capabilities,
      })
      require("lspconfig").gopls.setup({
        on_attach = on_attach,
        capabilities = capabilities,
      })
      require("lspconfig").lua_ls.setup({
        on_attach = on_attach,
        capabilities = capabilities,
        settings = {
          Lua = {
            runtime = {
              -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
              version = "LuaJIT",
            },
            diagnostics = {
              -- Get the language server to recognize the `vim` global
              globals = { "vim" },
            },
            workspace = {
              -- Make the server aware of Neovim runtime files
              library = vim.api.nvim_get_runtime_file("", true),
            },
            -- Do not send telemetry data containing a randomized but unique identifier
            telemetry = {
              enable = false,
            },
            completion = {
              callSnippet = "Replace",
            },
          },
        },
      })
      require("lspconfig").pylsp.setup({
        on_attach = on_attach,
        capabilities = capabilities,
      })
      require("lspconfig").graphql.setup({
        on_attach = on_attach,
        capabilities = capabilities,
      })
      require("lspconfig").ltex.setup({
        on_attach = on_attach,
        capabilities = capabilities,
      })
      require("lspconfig").bashls.setup({
        on_attach = on_attach,
        capabilities = capabilities,
      })
      require("lspconfig").yamlls.setup({
        on_attach = on_attach,
        capabilities = capabilities,
        yaml = {
          schemas = {
            kubernetes = "*.yaml",
          },
        },
      })
      require("lspconfig").docker_compose_language_service.setup({
        on_attach = on_attach,
        capabilities = capabilities,
      })
      require("lspconfig").dockerls.setup({
        on_attach = on_attach,
        capabilities = capabilities,
      })

      capabilities.textDocument.completion.completionItem.snippetSupport = true
      require("lspconfig").jsonls.setup({
        on_attach = on_attach,
        capabilities = capabilities,
      })
      -- require 'lspconfig'.jdtls.setup ({
      --   on_attach = on_attach,
      --   capabilities = capabilities,
      -- })

      require("lspconfig.ui.windows").default_options.border = "single"
    end,
  },
  {
    "nvimtools/none-ls.nvim",
    dependencies = {
      "nvimtools/none-ls-extras.nvim",
    },
    config = function()
      local null_ls = require("null-ls")
      local code_actions = null_ls.builtins.code_actions
      local diagnostics = null_ls.builtins.diagnostics
      local formatting = null_ls.builtins.formatting
      local hover = null_ls.builtins.hover
      local completion = null_ls.builtins.completion
      null_ls.setup({
        border = "single",
        on_attach = on_attach,
        sources = {
          -- code actions
          require("none-ls.code_actions.eslint_d"),

          -- diagnostics
          require("none-ls.diagnostics.eslint_d"),
          -- diagnostics.codespell,
          -- diagnostics.textidote,

          -- formatting
          require("none-ls.formatting.eslint_d"),
          formatting.pg_format,
          formatting.shfmt.with({ filetypes = { "sh", "zsh" } }),
          formatting.prettierd,
          -- formatting.prettier,
          formatting.stylua,
          formatting.remark,
        },
      })
    end,
  },
  {
    'mfussenegger/nvim-jdtls',
    ft = { "java" },
    config = function()
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)
      capabilities.textDocument.foldingRange = {
        dynamicRegistration = false,
        lineFoldingOnly = true,
      }

      local config = {
        cmd = { '/Users/grajakkannu/.local/share/nvim/mason/bin/jdtls' },
        root_dir = vim.fs.dirname(vim.fs.find({ 'gradlew', '.git', 'mvnw' }, { upward = true })[1]),
        on_attach = on_attach,
        capabilities = capabilities,
      }
      require('jdtls').start_or_attach(config)
    end
  },
  -- {
  --   "scalameta/nvim-metals",
  --   dependencies = {
  --     "nvim-lua/plenary.nvim",
  --   },
  --   ft = { "scala", "sbt", "java" },
  --   opts = function()
  --     local metals_config = require("metals").bare_config()
  --     metals_config.on_attach = on_attach
  --     return metals_config
  --   end,
  --   config = function(self, metals_config)
  --     local nvim_metals_group = vim.api.nvim_create_augroup("nvim-metals", { clear = true })
  --     vim.api.nvim_create_autocmd("FileType", {
  --       pattern = self.ft,
  --       callback = function()
  --         require("metals").initialize_or_attach(metals_config)
  --       end,
  --       group = nvim_metals_group,
  --     })
  --   end,
  -- },
}
