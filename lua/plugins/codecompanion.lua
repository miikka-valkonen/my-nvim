return {
  'olimorris/codecompanion.nvim',
  opts = {},
  keys = {
    { '<leader>ac', '<cmd>CodeCompanionChat Toggle<cr>', desc = '[C]hat', silent = true },
    { '<leader>aa', '<cmd>CodeCompanionActions<cr>', desc = '[A]ctions', silent = true },
    { mode = 'v', 'ga', '<cmd>CodeCompanionChat Add<cr>', desc = '[A]ctions', silent = true },
  },
  dependencies = {
    { 'nvim-lua/plenary.nvim', branch = 'master' },
    'nvim-treesitter/nvim-treesitter',
  },
}
