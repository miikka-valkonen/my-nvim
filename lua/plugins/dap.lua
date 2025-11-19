return {
  {
    'mfussenegger/nvim-dap',
    config = function()
      local dap = require 'dap'

      -- Keymaps for controlling the debugger
      vim.keymap.set('n', '<leader>dq', function()
        dap.terminate()
        dap.clear_breakpoints()
      end, { desc = 'Terminate and clear breakpoints' })

      vim.keymap.set('n', '<F5>', dap.continue, { desc = 'Start/continue debugging' })
      vim.keymap.set('n', '<F10>', dap.step_over, { desc = 'Step over' })
      vim.keymap.set('n', '<F11>', dap.step_into, { desc = 'Step into' })
      vim.keymap.set('n', '<leader>do', dap.step_out, { desc = 'Step out' })
      vim.keymap.set('n', '<leader>db', dap.toggle_breakpoint, { desc = 'Toggle breakpoint' })
      vim.keymap.set('n', '<leader>dB', function()
        dap.set_breakpoint(vim.fn.input 'Breakpoint condition: ')
      end, { desc = 'Breakpoint condition' })
      vim.keymap.set('n', '<leader>dc', dap.run_to_cursor, { desc = 'Run to cursor' })
      vim.keymap.set('n', '<leader>dr', dap.repl.toggle, { desc = 'Toggle DAP REPL' })
      vim.keymap.set('n', '<leader>dj', dap.down, { desc = 'Go down stack frame' })
      vim.keymap.set('n', '<leader>dk', dap.up, { desc = 'Go up stack frame' })

      -- .NET specific setup using `easy-dotnet`
      require('easy-dotnet.netcoredbg').register_dap_variables_viewer() -- special variables viewer specific for .NET
    end,
  },
}
