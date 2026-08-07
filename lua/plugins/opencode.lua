return {
  'nickjvandyke/opencode.nvim',
  version = '*', -- Latest stable release
  config = function()
    ---@type opencode.Opts
    vim.g.opencode_opts = {
      -- Your configuration, if any; goto definition on the type for details
      server = {
        start = function()
          if vim.env.TMUX then
            vim.system { 'tmux', 'split-window', '-h', '-d', 'opencode --port' }
          else
            vim.cmd 'vsplit term://opencode --port | wincmd p'
          end
        end,
      },
    }

    vim.o.autoread = true -- Required for `vim.g.opencode_opts.events.reload`

    vim.keymap.set({ 'n' }, '<leader>aa', function()
      require('opencode').ask '@this: '
    end, { desc = 'Ask OpenCode…' })
    vim.keymap.set({ 'n' }, '<leader>as', function()
      require('opencode').select()
    end, { desc = 'Select OpenCode…' })

    vim.keymap.set({ 'x' }, 'ga', function()
      return require('opencode').operator '@this '
    end, { desc = 'Append range to OpenCode', expr = true })
    vim.keymap.set({ 'n' }, 'ga', function()
      return require('opencode').operator '@this ' .. '_'
    end, { desc = 'Append line to OpenCode', expr = true })

    vim.keymap.set('n', '<leader>au', function()
      require('opencode').command 'session.half.page.up'
    end, { desc = 'Scroll OpenCode up' })
    vim.keymap.set('n', '<leader>ad', function()
      require('opencode').command 'session.half.page.down'
    end, { desc = 'Scroll OpenCode down' })
  end,
}
