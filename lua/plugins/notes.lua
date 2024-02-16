return {
  {
    "rguruprakash/simple-note.nvim",
    event = "VeryLazy",
    dependencies = {
      "nvim-telescope/telescope.nvim",
    },
    config = function()
      require("simple-note").setup()
    end,
    keys = {
      { "<leader>n", "<cmd>lua require('simple-note').listNotes()<CR>", desc = "list notelist notes" },
    },
  },
}
