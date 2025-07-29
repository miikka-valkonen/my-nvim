return {
  {
    'ionide/Ionide-vim',
    ft = { 'fsharp' },
    config = function()
      vim.g['fsharp#lsp_codelens'] = 0
      require('ionide').setup {}
    end,
  },
}
