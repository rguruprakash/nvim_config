return {
	{
		"folke/trouble.nvim",
		dependencies = "nvim-tree/nvim-web-devicons",
		config = function()
			require("trouble").setup({
				win = { type = "split", position = "right" },
				action_keys = {
					close = {},
					cancel = {},
				},
			})
		end,
	},
}
