return {
  {
    'smoka7/hop.nvim',
    version = '*',
    keys = {
      { 's', ':HopWord<CR>', desc = 'Hop word', silent = true },
      { 'S', ':HopChar1CurrentLine<CR>', desc = 'Hop char', silent = true },
    },
    opts = {
      keys = 'tsraneiodhplfugjvmwybk',
    },
  },
}
