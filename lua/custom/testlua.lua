local dap = {}

      dap.adapters = {
        ["pwa-node"] = {
          type = "executable",
          command = "js-debug-adapter",
        }
      }
      dap.adapters.node2 = {
        type = "executable",
        command = "node-debug2-adapter",
        -- args = {os.getenv('HOME') .. '/.zinit/plugins/microsoft---vscode-node-debug2.git/out/src/nodeDebug.js'},
        -- args =  { vim.fn.stdpath('data') .. '/mason/packages/node-debug2-adapter/out/src/nodeDebug.js' },
        args = {},
      }

vim.notify(vim.inspect(dap));
