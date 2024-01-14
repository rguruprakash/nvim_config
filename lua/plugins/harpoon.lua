return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local harpoon = require("harpoon")
		local extensions = require("harpoon.extensions")

		harpoon:setup({
			settings = {
				save_on_toggle = true,
				save_on_change = true,
			},
		}) -- REQUIRED

		harpoon:extend(extensions.builtins.command_on_nav("UfoEnableFold"))

		-- basic telescope configuration
		-- local conf = require("telescope.config").values
		-- local function toggle_telescope(harpoon_files)
		-- 	local file_paths = {}
		-- 	for _, item in ipairs(harpoon_files.items) do
		-- 		table.insert(file_paths, item.value)
		-- 	end

		-- 	require("telescope.pickers")
		-- 		.new({}, {
		-- 			prompt_title = "Harpoon",
		-- 			finder = require("telescope.finders").new_table({
		-- 				results = file_paths,
		-- 			}),
		-- 			previewer = conf.file_previewer({}),
		-- 			sorter = conf.generic_sorter({}),
		-- 		})
		-- 		:find()
		-- end

		vim.keymap.set("n", "<space>hl", function()
			harpoon.ui:toggle_quick_menu(harpoon:list())
			-- toggle_telescope(harpoon:list())
		end, { desc = "Open harpoon window" })

		vim.keymap.set("n", "<space>ha", function()
			harpoon:list():append()
		end)
		-- vim.keymap.set("n", "<space>hl", function()
		-- vim.keymap.set("n", "<space>hl", function()
		-- 	harpoon.ui:toggle_quick_menu(harpoon:list())
		-- end)

		vim.keymap.set("n", "<space>1", function()
			harpoon:list():select(1)
		end)
		vim.keymap.set("n", "<space>2", function()
			harpoon:list():select(2)
		end)
		vim.keymap.set("n", "<space>3", function()
			harpoon:list():select(3)
		end)
		vim.keymap.set("n", "<space>4", function()
			harpoon:list():select(4)
		end)

		-- Toggle previous & next buffers stored within Harpoon list
		vim.keymap.set("n", "<space>p", function()
			harpoon:list():prev()
		end)
		vim.keymap.set("n", "<space>n", function()
			harpoon:list():next()
		end)
	end,
}
