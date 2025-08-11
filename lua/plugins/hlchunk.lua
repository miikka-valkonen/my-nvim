return {
  'shellRaining/hlchunk.nvim',
  event = { 'BufReadPre', 'BufNewFile' },
  config = function()
    require('hlchunk').setup {
      chunk = {
        enable = true,
        use_treesitter = true,
        textobject = 'inner chunk',
        style = {
          { fg = '#f3ecd4' },
          { fg = '#c21f30' },
        },
        chars = {
          horizontal_line = '─',
          vertical_line = '│',
          left_top = '╭',
          left_bottom = '╰',
          right_arrow = '─',
        },
      },
    }
  end,
}
