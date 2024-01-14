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

local Popup = require("nui.popup")
local event = require("nui.utils.autocmd").event

local popup = Popup({
  enter = true,
  focusable = true,
  border = {
    style = "rounded",
  },
  position = "50%",
  size = {
    width = "80%",
    height = "60%",
  },
})

-- mount/open the component
popup:mount()

-- unmount component when cursor leaves buffer
popup:on(event.BufLeave, function()
  popup:unmount()
end)

-- pcall()
-- set content
-- vim.api.nvim_buf_set_lines(popup.bufnr, 0, 1, false, { "Hello World" })
-- vim.cmd("buffer" .. popup.bufnr)
vim.api.nvim_set_current_buf(popup.bufnr)
vim.cmd([[
    setlocal filetype=help
    setlocal buftype=help
    help vert
]])
-- vim.api.nvim_exec2("Neotest summary", { false })
-- vim.cmd([[ execute 'Neotest summary' ]])
