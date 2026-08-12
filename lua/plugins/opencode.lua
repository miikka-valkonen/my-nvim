return {
  'nickjvandyke/opencode.nvim',
  version = '*', -- Latest stable release
  config = function()
    ---@type opencode.Opts
    vim.g.opencode_opts = {
      -- Your configuration, if any; goto definition on the type for details
      server = {
        start = function()
          vim.cmd 'vsplit term://opencode --port | wincmd p'
        end,
      },
    }

    vim.o.autoread = true -- Required for `vim.g.opencode_opts.events.reload`

    vim.keymap.set({ 'n', 'x' }, 'gaa', function()
      require('opencode').ask '@this: '
    end, { desc = '[A]sk OpenCode…' })
    vim.keymap.set({ 'n', 'x' }, 'gas', function()
      require('opencode').select()
    end, { desc = '[S]elect OpenCode…' })
    vim.keymap.set({ 'n', 'x' }, 'gaA', function()
      return require('opencode').operator '@this '
    end, { desc = '[A]ppend range to OpenCode', expr = true })
  end,
}
