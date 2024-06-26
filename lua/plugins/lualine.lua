return {
  {
    "b0o/incline.nvim",
    config = function()
      require("incline").setup({
        hide = {
          cursorline = "focused_win",
        },
        highlight = {
          groups = {
            InclineNormal = {
              default = true,
              group = "@comment.hint",
            },
            InclineNormalNC = {
              default = true,
              group = "NormalFloat",
            },
          },
        },
      })
    end,
    -- Optional: Lazy load Incline
    event = "VeryLazy",
  },
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("lualine").setup({
				sections = {
					lualine_c = { { "filename", path = 1 } },
					-- lualine_x = {
					-- 	{
					-- 		require("noice").api.status.message.get_hl,
					-- 		cond = require("noice").api.status.message.has,
					-- 	},
					-- 	{
					-- 		require("noice").api.status.command.get,
					-- 		cond = require("noice").api.status.command.has,
					-- 		color = { fg = "#ff9e64" },
					-- 	},
					-- 	{
					-- 		require("noice").api.status.mode.get,
					-- 		cond = require("noice").api.status.mode.has,
					-- 		color = { fg = "#ff9e64" },
					-- 	},
					-- 	{
					-- 		require("noice").api.status.search.get,
					-- 		cond = require("noice").api.status.search.has,
					-- 		color = { fg = "#ff9e64" },
					-- 	},
					-- },
				},
				options = {
					theme = "catppuccin",
					-- ... the rest of your lualine config
				},
			})
		end,
	},
}
