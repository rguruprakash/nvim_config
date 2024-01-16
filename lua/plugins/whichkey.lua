return {
  "folke/which-key.nvim",
  config = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
    require("which-key").setup({})

    local wk = require("which-key")

    wk.register({
      ["1"] = { "<cmd>lua require('harpoon'):list():select(1)<CR>", "select 1" },
      ["2"] = { "<cmd>lua require('harpoon'):list():select(2)<CR>", "select 2" },
      ["3"] = { "<cmd>lua require('harpoon'):list():select(3)<CR>", "select 3" },
      ["4"] = { "<cmd>lua require('harpoon'):list():select(4)<CR>", "select 4" },
      h = {
        name = "Harpoon",
        l = {
          "<cmd>lua require('harpoon').ui:toggle_quick_menu(require('harpoon'):list())<CR>",
          "Open window",
        },
        a = {
          "<cmd>lua require('harpoon'):list():append()<CR>",
          "append",
        },
      },
    }, { prefix = "<space>" })

    wk.register({
      ["<F5>"] = { "<cmd>lua require('dap').continue()<CR>", "Continue" },
      ["<F6>"] = { "<cmd>lua require('dap').step_over()<CR>", "Step over" },
      ["<F7>"] = { "<cmd>lua require('dap').step_into()<CR>", "Step into" },
      ["<F8>"] = { "<cmd>lua require('dap').step_out()<CR>", "Step out" },
      d = {
        name = "Debug",
        b = { "<cmd>lua require('dap').toggle_breakpoint()<CR>", "Toggle breakpoint" },
        p = {
          "<cmd>lua require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>",
          "Log point",
        },
        r = { "<cmd>lua require('dap').repl.toggle()<CR>", "Toggle REPL" },
        l = { "<cmd>lua require('dap').run_last()<CR>", "Run last" },
        u = { "<cmd>lua require('dapui').toggle()<CR>", "Toggle UI" },
        h = { "<cmd>lua require('dap.ui.widgets').hover()<CR>", "Hover" },
        f = {
          "<cmd>lua require('dap.ui.widgets').centered_float(require('dap.ui.widgets').frames)<CR>",
          "Frames",
        },
        s = {
          "<cmd>lua require('dap.ui.widgets').centered_float(require('dap.ui.widgets').scopes)<CR>",
          "Scopes",
        },
      },
    }, { prefix = "<leader>" })
  end,
}
