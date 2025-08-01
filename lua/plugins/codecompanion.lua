return {
  'olimorris/codecompanion.nvim',
  opts = {},
  keys = {
    { 'n', '<leader>ac', '<cmd>CodeCompanionChat Toggle<cr>', desc = '[C]hat', silent = true },
    { 'n', '<leader>aa', '<cmd>CodeCompanionActions<cr>', desc = '[A]ctions', silent = true },
    { 'v', 'ga', '<cmd>CodeCompanionChat Add<cr>', desc = '[A]ctions', silent = true },
  },
  dependencies = {
    { 'nvim-lua/plenary.nvim', branch = 'master' },
    'nvim-treesitter/nvim-treesitter',
  },
}
