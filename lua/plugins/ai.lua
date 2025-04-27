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
    branch = "main",
		event = "VeryLazy",
		dependencies = {
			{ "github/copilot.vim" }, -- or zbirenbaum/copilot.lua
			{ "nvim-lua/plenary.nvim", branch = "master" }, -- for curl, log and async functions
		},
		build = "make tiktoken", -- Only on MacOS or Linux
		opts = {
			show_help = false, -- Show help text for CopilotChatInPlace, default: yes
			debug = false, -- Enable or disable debug mode, the log file will be in ~/.local/state/nvim/CopilotChat.nvim.log
			disable_extra_info = "yes", -- Disable extra information (e.g: system prompt) in the response.
			window = {
				layout = "float", -- 'vertical', 'horizontal', 'float', 'replace'
				width = 0.9, -- fractional width of parent, or absolute width in columns when > 1
				height = 0.8, -- fractional height of parent, or absolute height in rows when > 1
				-- Options below only apply to floating windows
				relative = "editor", -- 'editor', 'win', 'cursor', 'mouse'
				border = "single", -- 'none', single', 'double', 'rounded', 'solid', 'shadow'
				row = nil, -- row position of the window, default is centered
				col = nil, -- column position of the window, default is centered
				title = "Copilot Chat", -- title of chat window
				footer = nil, -- footer of chat window
				zindex = 1, -- determines if window is on top or below other floating windows
			},
		},
		keys = {
			{
				"<space>cc",
				":CopilotChatOpen<cr>",
				desc = "CopilotChat - Open in floating window",
			},
			{
				"<space>ccr",
				":CopilotChatReset<cr>",
				desc = "CopilotChat - Rest copilot chat",
			},
		},
	},
	{
		"yetone/avante.nvim",
		event = "VeryLazy",
		lazy = false,
		version = false, -- set this if you want to always pull the latest change
		opts = {
			provider = "openai",
			auto_suggestions_provider = "openai",
			openai = {
				endpoint = "https://zllm.data.zalan.do/v1",
				model = "openai/gpt-4o",
				api_key_name = "cmd:ztoken",
				timeout = 30000, -- timeout in milliseconds
				temperature = 0, -- adjust if needed
				max_tokens = 4096,
			},
			-- vendors = {
			-- 	["zalando-openai"] = {
			-- 		__inherited_from = "openai",
			-- 		endpoint = "https://zllm.data.zalan.do/v1",
			-- 		model = "openai/gpt-4o",
			-- 		api_key_name = "cmd:ztoken",
			-- 	},
			-- },
			windows = {
				width = 50, -- default % based on available width
				ask = {
					start_insert = false, -- Start insert mode when opening the ask window
				},
			},
			mappings = {
				sidebar = {
					close = { "q" },
					close_from_input = { normal = "q" },
				},
			},
		},
		-- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
		build = "make",
		-- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"stevearc/dressing.nvim",
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
			--- The below dependencies are optional,
			"nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
			"zbirenbaum/copilot.lua", -- for providers='copilot'
			{
				-- support for image pasting
				"HakonHarnes/img-clip.nvim",
				event = "VeryLazy",
				opts = {
					-- recommended settings
					default = {
						embed_image_as_base64 = false,
						prompt_for_file_name = false,
						drag_and_drop = {
							insert_mode = true,
						},
						-- required for Windows users
						use_absolute_path = true,
					},
				},
			},
			{
				-- Make sure to set this up properly if you have lazy=true
				"MeanderingProgrammer/render-markdown.nvim",
				opts = {
					file_types = { "markdown", "Avante" },
				},
				ft = { "markdown", "Avante" },
			},
		},
	},
	{
		"olimorris/codecompanion.nvim",
		opts = {},
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
		},
	},
}
