return {
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope-live-grep-args.nvim",
		},
		event = "VeryLazy",
		config = function()
			local telescope = require("telescope")
			local lga_actions = require("telescope-live-grep-args.actions")
			telescope.setup({
				defaults = {
					layout_strategy = "vertical",
					mappings = {
						i = { ["<c-x>"] = require("trouble.providers.telescope").open_with_trouble },
						n = { ["<c-x>"] = require("trouble.providers.telescope").open_with_trouble },
					},
				},
				pickers = {
					theme = "dropdown",
				},
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
					ive_grep_args = {
						auto_quoting = true, -- enable/disable auto-quoting
						-- define mappings, e.g.
						mappings = { -- extend mappings
							i = {
								["<c-k>"] = lga_actions.quote_prompt(),
								["<c-i>"] = lga_actions.quote_prompt({ postfix = " --iglob " }),
							},
						},
					},
				},
			})
			telescope.load_extension("live_grep_args")
		end,
		keys = {
			{
				"<C-f>",
				":lua require('telescope').extensions.live_grep_args.live_grep_args()<cr>",
				desc = "Search in project",
			},
			{
				"<C-l>",
				":Telescope treesitter<cr>",
				desc = "Find document symbols",
			},
			{
				"<C-h>",
				":Telescope help_tags<cr>",
				desc = "Help tags",
			},
			{
				"<leader>f",
				":Telescope filetypes<cr>",
				desc = "File types",
			},
			{
				"z=",
				":Telescope spell_suggest<cr>",
				desc = "Spell suggest",
			},
			{ "<leader>p", ":lua require'telescope'.extensions.projects.projects{}<cr>", desc = "Find project" },
		},
	},
}
