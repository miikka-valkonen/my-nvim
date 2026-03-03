return {
  'Wotee/adoboards.nvim',
  opts = {},
  keys = {
    { '<leader>wb', '<cmd>Adoboards<cr>', desc = 'Ado[B]oards' },
    {
      '<leader>wB',
      function()
        local workItem = vim.fn.system('print_branch.sh'):gsub('%s+$', '')
        if not workItem:match '^%d+$' then
          return
        end
        vim.cmd(string.format('Adoboards %s', workItem))
      end,
      desc = 'Ado[B]oards for current WI',
    },
  },
}
