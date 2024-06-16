return {
  {
    "rguruprakash/simple-note.nvim",
    event = "VeryLazy",
    dependencies = {
      "nvim-telescope/telescope.nvim",
    },
    config = function()
      require("simple-note").setup({
        notes_dir = "~/notes/",
        notes_directories = {"~/notes/", "~/curls/", "~/notes/personal/", "~/notes/sports-questionnaires/"},
      })
    end,
    keys = {
      { "<leader>n", "<cmd>lua require('simple-note').listNotes()<CR>", desc = "list notelist notes" },
    },
  },
}
