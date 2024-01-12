return {
	-- "folke/persistence.nvim",
	-- event = "BufReadPre", -- this will only start session saving when an actual file was opened
	-- opts = {
	-- 	-- add any custom options here
	-- },

	"rmagatti/auto-session",
	config = function()
		vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
		require("auto-session").setup({
			log_level = "error",
			auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
		})
	end,
}
