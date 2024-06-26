return {
  "nvim-neotest/neotest",
  event = "VeryLazy",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-treesitter/nvim-treesitter",
    "nvim-neotest/nvim-nio",
    "nvim-neotest/neotest-jest",
    "nvim-neotest/neotest-go",
  },
  config = function()
    -- get neotest namespace (api call creates or returns namespace)
    local neotest_ns = vim.api.nvim_create_namespace("neotest")
    vim.diagnostic.config({
      virtual_text = {
        format = function(diagnostic)
          local message = diagnostic.message:gsub("\n", " "):gsub("\t", " "):gsub("%s+", " "):gsub("^%s+", "")
          return message
        end,
      },
    }, neotest_ns)
    require("neotest").setup({
      summary = {
        open = "botright vsplit",
      },
      adapters = {
        require("neotest-go"),
        require("neotest-jest")({
          cwd = function(path)
            -- To support mono-repo
            if string.find(path, "/packages/") then
              return string.match(path, "(.-/[^/]+/)src")
            end

            return vim.fn.getcwd();
          end,

          -- For Raffles repo
          -- jestCommand = require("neotest-jest.jest-util").getJestCommand(vim.fn.expand("%:p:h"))
          --     .. " -i --detectOpenHandles",
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
        }),
      },
    })
  end,
  keys = {
    { "<leader>tr", ":Neotest run<cr>",            desc = "Test run" },
    { "<leader>ts", ":Neotest summary toggle<cr>", desc = "Test summary toggle" },
  },
}
