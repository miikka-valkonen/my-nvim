return {
  {
    'mfussenegger/nvim-dap',
    dependencies = {
      'rcarriga/nvim-dap-ui',
      'nvim-neotest/nvim-nio',
    },
    config = function()
      local dap = require 'dap'
      local dapui = require 'dapui'

      dap.adapters.coreclr = {
        type = 'executable',
        command = 'netcoredbg',
        args = { '--interpreter=vscode' },
      }

      dap.configurations.cs = {
        {
          type = 'coreclr',
          name = 'launch - netcoredbg',
          request = 'launch',
          program = function()
            return vim.fn.input('Path to dll: ', vim.fn.getcwd() .. '/bin/Debug/net10.0/', 'file')
          end,
        },
      }

      dap.configurations.fsharp = {
        {
          type = 'coreclr',
          name = 'launch - netcoredbg',
          request = 'launch',
          program = function()
            return vim.fn.input('Path to dll: ', vim.fn.getcwd() .. '/bin/Debug/net10.0/', 'file')
          end,
        },
        {
          type = 'coreclr',
          name = 'attach - azure function',
          request = 'attach',
          processId = function()
            return require('dap.utils').pick_process()
          end,
        },
      }

      dapui.setup()

      -- auto-open/close UI
      dap.listeners.after.event_initialized['dapui_config'] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated['dapui_config'] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited['dapui_config'] = function()
        dapui.close()
      end

      -- Keymaps for controlling the debugger
      vim.keymap.set('n', '<leader>zq', function()
        dap.terminate()
        dap.clear_breakpoints()
      end, { desc = 'Terminate and clear breakpoints' })

      vim.keymap.set('n', '<F5>', dap.continue, { desc = 'Start/continue debugging' })
      vim.keymap.set('n', '<F10>', dap.step_over, { desc = 'Step over' })
      vim.keymap.set('n', '<F11>', dap.step_into, { desc = 'Step into' })
      vim.keymap.set('n', '<leader>zo', dap.step_out, { desc = 'Step out' })
      vim.keymap.set('n', '<leader>zb', dap.toggle_breakpoint, { desc = 'Toggle breakpoint' })
      vim.keymap.set('n', '<leader>zB', function()
        dap.set_breakpoint(vim.fn.input 'Breakpoint condition: ')
      end, { desc = 'Breakpoint condition' })
      vim.keymap.set('n', '<leader>zc', dap.run_to_cursor, { desc = 'Run to cursor' })
      vim.keymap.set('n', '<leader>zr', dap.repl.toggle, { desc = 'Toggle DAP REPL' })
      vim.keymap.set('n', '<leader>zj', dap.down, { desc = 'Go down stack frame' })
      vim.keymap.set('n', '<leader>zk', dap.up, { desc = 'Go up stack frame' })
    end,
  },
}
