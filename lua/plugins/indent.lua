return {
  {
    'nvimdev/indentmini.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    opts = {
      only_current = true,
    },
  },
}
