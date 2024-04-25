return {
	"sindrets/diffview.nvim",
	-- use({
	--   "sindrets/diffview.nvim",
	--   requires = "nvim-lua/plenary.nvim",
	--   config = function()
	--     require("diffview").setup({
	--       enhanced_diff_hl = true,
	--       view = {
	--         default = {
	--           layout = "diff2_vertical",
	--         },
	--         merge_tool = {
	--           layout = "diff3_vertical",
	--         },
	--       },
	--       file_panel = {
	--         type = "split",
	--         win_config = {
	--           position = "bottom",
	--           height = 40
	--         }
	--       },
	--     })
	--     vim.cmd [[
	--       hi! DiffChange guibg=#6a5f51
	--       hi! DiffText guibg=#90826f
	--     ]]
	--   end,
	-- }) -- git diff plugin
	{
		"lewis6991/gitsigns.nvim",
		event = "VeryLazy",
		config = function()
			require("gitsigns").setup()
		end,
		keys = {
			{ "gsn", ":Gitsigns next_hunk<cr>", desc = "Git next hunk" },
			{ "gsp", ":Gitsigns prev_hunk<cr>", desc = "Git prev hunk" },
			{ "gsr", ":Gitsigns reset_hunk<cr>", desc = "Git rest hunk" },
		},
	},
	{
		"kdheepak/lazygit.nvim",
		-- optional for floating window border decoration
		event = "VeryLazy",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		config = function()
			require("telescope").load_extension("lazygit")
		end,
		keys = {
			{ "<leader>lg", ":LazyGit<cr>", desc = "Lazygit" },
		},
	},
	{
		"moyiz/git-dev.nvim",
		event = "VeryLazy",
		opts = {},
	},
}
