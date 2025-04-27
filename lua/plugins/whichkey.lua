-- paste without losing what was in the registergister
-- vim.keymap.set("x", "<space>p", '"_dP')

-- Find and replace text under cursor
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

return {
	"folke/which-key.nvim",
	config = function()
		local wk = require("which-key")
		wk.add({
			{ "<leader><F5>", "<cmd>lua require('dap').continue()<CR>", desc = "Continue" },
			{ "<leader><F6>", "<cmd>lua require('dap').step_over()<CR>", desc = "Step over" },
			{ "<leader><F7>", "<cmd>lua require('dap').step_into()<CR>", desc = "Step into" },
			{ "<leader><F8>", "<cmd>lua require('dap').step_out()<CR>", desc = "Step out" },
			{ "<leader>c", ":e ~/.config/nvim/lua/plugins/init.lua<cr>", desc = "nvim config" },
			{ "<leader>d", group = "Debug" },
			{ "<leader>db", "<cmd>lua require('dap').toggle_breakpoint()<CR>", desc = "Toggle breakpoint" },
			{
				"<leader>df",
				"<cmd>lua require('dap.ui.widgets').centered_float(require('dap.ui.widgets').frames)<CR>",
				desc = "Frames",
			},
			{ "<leader>dh", "<cmd>lua require('dap.ui.widgets').hover()<CR>", desc = "Hover" },
			{ "<leader>dl", "<cmd>lua require('dap').run_last()<CR>", desc = "Run last" },
			{
				"<leader>dp",
				"<cmd>lua require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>",
				desc = "Log point",
			},
			{ "<leader>dr", "<cmd>lua require('dap').repl.toggle()<CR>", desc = "Toggle REPL" },
			{
				"<leader>ds",
				"<cmd>lua require('dap.ui.widgets').centered_float(require('dap.ui.widgets').scopes)<CR>",
				desc = "Scopes",
			},
			{ "<leader>du", "<cmd>lua require('dapui').toggle()<CR>", desc = "Toggle UI" },
			{ "<leader>r", ":luafile %<cr>", desc = "lua run" },
			{ "J", ":m '>+1<CR>gv=gv", desc = "Move line block up", mode = "v" },
			{ "K", ":m '<-2<CR>gv=gv", desc = "Move line block up", mode = "v" },
		})
	end,
	opts = {
		delay = function(ctx)
			return 200
		end,
	},
}
