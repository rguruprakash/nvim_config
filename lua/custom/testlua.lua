-- local M = {}

-- function M.main()
-- print(vim.fn.expand("%:p:h"))
-- print(require('neotest-jest.jest-util').getJestConfig("abc"))
-- print(vim.fn.getcwd())
-- local a = require('dap')
-- print(vim.inspect(a.list_breakpoints()))
-- vim.ui.input({ prompt = 'Enter value for shiftwidth: ' }, function(input)
--   print(input)
-- end)
-- vim.cmd('cd ~/git/monroe/integration_test/')
-- local output = vim.fn.system('go test ./... -list .')
-- local lines = vim.split(output, '\n')
-- local tests = {}
-- local args = {}
-- for _, line in pairs(lines) do
--   table.insert(tests, vim.fn.trim(line))
-- end
-- vim.ui.select(tests, { label = 'tests> ' }, function(choice)
--   table.insert(args, '-run')
--   table.insert(args, choice)
--   -- print(vim.inspect(type(args)))
--   print(vim.inspect(args))
-- end)
-- end

-- M.main()

-- local Popup = require("nui.popup")
-- local event = require("nui.utils.autocmd").event

-- local popup = Popup({
--   enter = true,
--   focusable = true,
--   border = {
--     style = "rounded",
--   },
--   position = "50%",
--   size = {
--     width = "80%",
--     height = "60%",
--   },
-- })

-- mount/open the component
-- popup:mount()

-- unmount component when cursor leaves buffer
-- popup:on(event.BufLeave, function()
--   popup:unmount()
-- end)

-- pcall()
-- set content
-- vim.api.nvim_buf_set_lines(popup.bufnr, 0, 1, false, { "Hello World" })
-- vim.cmd("buffer" .. popup.bufnr)
-- vim.api.nvim_set_current_buf(popup.bufnr)
-- vim.cmd([[
--     setlocal filetype=help
--     setlocal buftype=help
--     help vert
-- ]])
-- vim.api.nvim_exec2("Neotest summary", { false })
-- vim.cmd([[ execute 'Neotest summary' ]])
--
-- Create a new empty buffer
-- local buf = vim.api.nvim_create_buf(false, true)

-- Define the window properties
-- local win_opts = {
-- 	relative = "editor",
-- 	width = 20,
-- 	height = 10,
-- 	col = 10,
-- 	row = 10,
-- 	style = "minimal",
-- 	bufpos = { 1, 1 },
-- 	focusable = true,
-- }

-- Create the floating window
-- local win = vim.api.nvim_open_win(buf, true, win_opts)
--
-- local notes_path = vim.fn.expand('~/notes/')
-- local full_path = notes_path .. 'test' .. '.md'
-- local file = io.open(full_path, "a")
-- local a = ""
-- if a ~= "" then
--   vim.notify("a is not empty")
-- else
--   vim.notify("a is empty")
-- end
-- vim.notify(full_path);
-- vim.notify(vim.inspect(file));

-- local bufnr = vim.api.nvim_get_current_buf()
-- local filetype = vim.api.nvim_buf_get_option(bufnr, "filetype")
local a = {}
table.insert(a, "a")
-- vim.notify(vim.inspect(require("null-ls.sources").get_available(filetype)))
vim.notify(#a > 1)
