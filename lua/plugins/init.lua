return {
  "simeji/winresizer",
  "mg979/vim-visual-multi",
  "tpope/vim-commentary",
  "tpope/vim-fugitive",
  "tpope/vim-rhubarb",
  "nvim-lua/plenary.nvim",
  "tpope/vim-surround",
  "nvim-treesitter/nvim-treesitter",
  "easymotion/vim-easymotion",
  -- use({
  -- 	"jackMort/ChatGPT.nvim",
  -- 	config = function()
  -- 		require("chatgpt").setup()
  -- 	end,
  -- 	requires = {
  -- 		"MunifTanjim/nui.nvim",
  -- 		"nvim-lua/plenary.nvim",
  -- 		"nvim-telescope/telescope.nvim",
  -- 	},
  -- })
  -- use({
  -- 	"m4xshen/hardtime.nvim",
  -- 	config = function()
  -- 		require("hardtime").setup()
  -- 	end,
  -- })
  {
    "folke/which-key.nvim",
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
      require("which-key").setup({
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      })
    end,
  },
  {
    "iamcco/markdown-preview.nvim",
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
  },
  "github/copilot.vim",
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter",
      "nvim-neotest/neotest-jest",
    },
    config = function()
      require("neotest").setup({
        adapters = {
          require("neotest-jest")({
            jestCommand = require("neotest-jest.jest-util").getJestCommand(vim.fn.expand("%:p:h"))
                .. " -i --detectOpenHandles",
            -- jestConfigFile = "custom.jest.config.ts",
            -- env = {
            --   NODE_ENV = "testing",
            --   PG_HOST = "localhost",
            --   PG_HOST_REPLICA = "localhost",
            --   PG_USER = "postgres",
            --   PG_PASSWORD = "postgres",
            --   PG_DATABASE = "rms",
            --   PG_PORT = 5433,
            --   PGPASSWORD = "postgres",
            --   TRANSLATIONS_FILE_PATH = "./integration_tests/translations.json",
            -- },
            cwd = function()
              return vim.fn.getcwd()
            end,
          }),
        },
      })
    end,
  },
}
