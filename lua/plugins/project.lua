return {
	{
		"ahmedkhalf/project.nvim",
    dependencies = {
      "nvim-telescope/telescope.nvim",
    },
    lazy = false,
		config = function()
			require("project_nvim").setup({
				detection_methods = {
					-- "lsp",
					"pattern",
				},
				patterns = {
					".git",
					-- "Makefile",
					-- "*.sln",
					-- "build/env.sh",
				},
				silent_chdir = true,
			})

			require("telescope").load_extension("projects")
		end,
		keys = {
			{
				"<C-p>",
				":lua require'custom.telescope'.project_files()<cr>",
				desc = "Find project files",
			},
		},
	},
}
