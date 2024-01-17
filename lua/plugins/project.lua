return {
  {
    "ahmedkhalf/project.nvim",
    config = function()
      require("project_nvim").setup({
        detection_methods = {
          -- "lsp",
          "pattern",
        },
        patterns = {
          ".git",
          -- "Makefile",
          -- "*.sln",
          -- "build/env.sh",
        },
        silent_chdir = true,
      })
    end,
  },
}
