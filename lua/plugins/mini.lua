return {
	{
		"echasnovski/mini.nvim",
		config = function()
			require("mini.splitjoin").setup()
			-- require("mini.jump").setup()
			-- require("mini.notify").setup()
			-- require("mini.animate").setup({
			--   cursor = {
			--     enable = false,
			--   },
			-- })
		end,
	},
}
