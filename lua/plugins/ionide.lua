return {
  'ionide/ionide-vim',
  config = function()
    -- vim.g['fsharp#lsp_codelens'] = 0
    -- vim.api.nvim_create_autocmd({ 'BufEnter', 'InsertLeave' }, {
    --   pattern = { '*.fs', '*.fsx', '*.fsi' },
    --   callback = function()
    --     vim.lsp.codelens.enable(false)
    --     vim.lsp.codelens.enable(true)
    --   end,
    -- })
  end,
}
