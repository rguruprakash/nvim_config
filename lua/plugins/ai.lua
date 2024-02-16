return {
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "InsertEnter",
		config = function()
			require("copilot").setup({
				suggestion = { enabled = false },
				panel = { enabled = false },
			})
		end,
		keys = {
			{ "<space>cp", "<cmd>CopilotPanel<cr>", desc = "Copilot panel" },
		},
	},
	{
		"zbirenbaum/copilot-cmp",
		config = function()
			require("copilot_cmp").setup()
		end,
	},
	{
		"CopilotC-Nvim/CopilotChat.nvim",
		opts = {
			show_help = "yes", -- Show help text for CopilotChatInPlace, default: yes
			debug = false, -- Enable or disable debug mode, the log file will be in ~/.local/state/nvim/CopilotChat.nvim.log
			disable_extra_info = "yes", -- Disable extra information (e.g: system prompt) in the response.
		},
		build = function()
			vim.notify("Please update the remote plugins by running ':UpdateRemotePlugins', then restart Neovim.")
		end,
		event = "VeryLazy",
		keys = {
			{ "<space>cce", "<cmd>CopilotChatExplain<cr>", desc = "CopilotChat - Explain code" },
			{ "<space>cct", "<cmd>CopilotChatTests<cr>", desc = "CopilotChat - Generate tests" },
			{
				"<space>cc",
				":CopilotChat ",
				desc = "CopilotChat - Open in vertical split",
			},
			-- {
			--   "<space>ccv",
			--   ":CopilotChatVisual",
			--   desc = "CopilotChat - Open in vertical split",
			-- },
			{
				"<space>ccx",
				":CopilotChatInPlace<cr>",
				mode = { "n", "v", "x" },
				desc = "CopilotChat - Run in-place code",
			},
		},
	},
}
