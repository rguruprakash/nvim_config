return {
  {
    "mfussenegger/nvim-dap",
    config = function()
      local dap = require("dap")
      -- ADAPTERS
      dap.adapters = {
        -- before using this adapter be sure to launch the adapter server first with command 'js-debug-adapter'
        ["pwa-node"] = {
          type = "server",
          host = "localhost",
          port = 8123
        }
      }
      dap.adapters.node2 = {
        type = "executable",
        command = "node-debug2-adapter",
        -- args = {os.getenv('HOME') .. '/.zinit/plugins/microsoft---vscode-node-debug2.git/out/src/nodeDebug.js'},
        -- args =  { vim.fn.stdpath('data') .. '/mason/packages/node-debug2-adapter/out/src/nodeDebug.js' },
        args = {},
      }
      dap.adapters.delve = {
        type = "server",
        port = "${port}",
        executable = {
          command = "dlv",
          args = { "dap", "-l", "127.0.0.1:${port}" },
        },
      }

      local exts = {
        "javascript",
        "typescript",
        "javascriptreact",
        "typescriptreact",
      }
      dap.configurations.go = {
        {
          type = "delve",
          name = "Debug",
          request = "attach",
          port = 8080,
          processId = require("dap.utils").pick_process,
        },
        {
          type = "delve",
          name = "Debug test",
          request = "launch",
          mode = "test",
          program = "./${relativeFileDirname}",
          args = function()
            return coroutine.create(function(dap_run_co)
              local command = "go test " .. vim.fn.expand("%:p:h") .. "/... -list ."
              local output = vim.fn.system(command)
              local lines = vim.split(output, "\n")
              local tests = {}
              local args = {}
              for _, line in pairs(lines) do
                if line ~= "" then
                  table.insert(tests, vim.fn.trim(line))
                end
              end
              vim.ui.select(tests, { label = "tests> " }, function(choice)
                if choice == nil then
                  coroutine.resume(dap_run_co, args)
                else
                  table.insert(args, "-test.run")
                  table.insert(args, choice)
                  vim.ui.input({ prompt = "Testname in suite" }, function(input)
                    if input ~= nil then
                      table.insert(args, "-testify.m")
                      table.insert(args, input)
                    end
                    coroutine.resume(dap_run_co, args)
                  end)
                end
              end)
            end)
          end,
        },
      }

      for i, ext in ipairs(exts) do
        dap.configurations[ext] = {
          {
            -- For this to work you need to make sure the node process is started with the `--inspect` flag.
            name = "Attach to process",
            type = "node2",
            request = "attach",
            restart = true,
            -- port = 9229
            processId = require("dap.utils").pick_process,
          },
        }
      end
    end,
  },

  {
    "rcarriga/nvim-dap-ui",
    dependencies = {
      "mfussenegger/nvim-dap",
      "nvim-neotest/nvim-nio"
    },
    config = function()
      require("dapui").setup({
        layouts = {
          {
            elements = {
              {
                id = "scopes",
                size = 0.25,
              },
              {
                id = "breakpoints",
                size = 0.25,
              },
              {
                id = "stacks",
                size = 0.25,
              },
              {
                id = "watches",
                size = 0.25,
              },
            },
            position = "left",
            size = 40,
          },
          {
            elements = {
              {
                id = "repl",
                size = 0.5,
              },
              {
                id = "console",
                size = 0.5,
              },
            },
            position = "bottom",
            size = 20,
          },
        },
      })
      local dap = require("dap")
      local dapui = require("dapui")
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      -- dap.listeners.before.event_terminated["dapui_config"] = function()
      --   dapui.close()
      -- end
      -- dap.listeners.before.event_exited["dapui_config"] = function()
      --   dapui.close()
      -- end

      vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "DapBreakpoint", linehl = "", numhl = "" })
      vim.fn.sign_define("DapStopped", { text = "﯀", texthl = "DapStopped", linehl = "", numhl = "" })
    end,
  },
  {
    "theHamsta/nvim-dap-virtual-text",
    config = function()
      require("nvim-dap-virtual-text").setup()
    end,
  },
}
