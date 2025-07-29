return {
  'olimorris/codecompanion.nvim',
  opts = {},
  keys = {
    { '<leader>cc', '<cmd>CodeCompanionChat Toggle<cr>', desc = '[C]odeCompanion chat' },
  },
  dependencies = {
    { 'nvim-lua/plenary.nvim', branch = 'master' },
    'nvim-treesitter/nvim-treesitter',
  },
}
