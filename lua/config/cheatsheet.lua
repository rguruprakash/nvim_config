return {
	{
		"sudormrfbin/cheatsheet.nvim", --cheatsheet
		dependencies = {
			"nvim-telescope/telescope.nvim",
			"nvim-lua/plenary.nvim",
		},
		config = function()
			require("cheatsheet").setup({
				bundled_cheatsheets = false,
			})
		end,
	},
}
