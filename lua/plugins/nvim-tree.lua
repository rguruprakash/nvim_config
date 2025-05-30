return {
	{
		"kyazdani42/nvim-tree.lua",
		event = "VeryLazy",
		dependencies = "nvim-tree/nvim-web-devicons",
		config = function()
			local HEIGHT_RATIO = 0.8 -- You can change this
			local WIDTH_RATIO = 0.5 -- You can change this too

			require("nvim-tree").setup({
				sync_root_with_cwd = true,
				respect_buf_cwd = true,
        disable_netrw = false,
				update_focused_file = {
					enable = true,
					update_root = true,
				},
				view = {
					float = {
						enable = true,
						open_win_config = function()
							local screen_w = vim.opt.columns:get()
							local screen_h = vim.opt.lines:get() - vim.opt.cmdheight:get()
							local window_w = screen_w * WIDTH_RATIO
							local window_h = screen_h * HEIGHT_RATIO
							local window_w_int = math.floor(window_w)
							local window_h_int = math.floor(window_h)
							local center_x = (screen_w - window_w) / 2
							local center_y = ((vim.opt.lines:get() - window_h) / 2) - vim.opt.cmdheight:get()
							return {
								border = "rounded",
								relative = "editor",
								row = center_y,
								col = center_x,
								width = window_w_int,
								height = window_h_int,
							}
						end,
					},
					width = function()
						return math.floor(vim.opt.columns:get() * WIDTH_RATIO)
					end,
				},
				on_attach = function(bufnr)
					local api = require("nvim-tree.api")
					local function opts(desc)
						return {
							desc = "nvim-tree: " .. desc,
							buffer = bufnr,
							noremap = true,
							silent = true,
							nowait = true,
						}
					end
					api.config.mappings.default_on_attach(bufnr)
					local function search_in_node()
						local node = api.tree.get_node_under_cursor()
						require("telescope.builtin").live_grep({ cwd = node.absolute_path })
					end
          local function open_in_vscode()
            local node = api.tree.get_node_under_cursor()
            vim.cmd("silent !code " .. node.absolute_path)
          end
					vim.keymap.set("n", "S", search_in_node, opts("Search in node"))
					vim.keymap.set("n", "O", open_in_vscode, opts("Open in vscode"))
				end,
				actions = {
					open_file = {
						window_picker = {
							enable = false,
						},
					},
				},
			})
		end,
		keys = {
			{ "_", ":NvimTreeToggle<CR>", desc = "File tree toggle" },
			{ "<leader>-", ":NvimTreeFindFile!<CR>", desc = "Find file in file tree" },
		},
	},
	{
		"stevearc/oil.nvim",
		opts = {
      default_file_explorer = false,
    },
		-- Optional dependencies
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},
}
