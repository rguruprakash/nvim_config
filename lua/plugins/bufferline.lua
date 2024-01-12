return {
  {
    "akinsho/bufferline.nvim",
    version = "v3.*",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
      require("bufferline").setup({
        options = {
          highlights = require("catppuccin.groups.integrations.bufferline").get(),
          mode = "tabs",
          show_buffer_close_icons = false,
          always_show_bufferline = false,
          -- offsets = {
          -- 	{
          -- 		filetype = "NvimTree",
          -- 		text = "File Explorer",
          -- 		highlight = "Directory",
          -- 		separator = true, -- use a "true" to enable the default, or set your own character
          -- 	},
          -- },
        },
      })
    end,
  },
}
