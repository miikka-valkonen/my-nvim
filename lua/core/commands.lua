-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.hl.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

vim.api.nvim_create_autocmd('User', {
  pattern = 'PersistenceSavePre',
  callback = function()
    vim.cmd ':Neotree close'
  end,
})

vim.api.nvim_create_autocmd('User', {
  pattern = 'PersistenceSavePost',
  callback = function()
    local name = vim.fn.getcwd():gsub('[\\/:]+', '%%')
    require('dart').write_session(name)
  end,
})

vim.api.nvim_create_autocmd('User', {
  pattern = 'PersistenceLoadPost',
  callback = function()
    local name = vim.fn.getcwd():gsub('[\\/:]+', '%%')
    require('dart').read_session(name)
  end,
})

vim.api.nvim_create_autocmd('Filetype', {
  pattern = 'norg',
  callback = function()
    vim.keymap.set('n', '<C-Space>', '<Plug>(neorg.qol.todo-items.todo.task-cycle)', { buffer = true })
    vim.keymap.set('n', '<CR>', '<Plug>(neorg.esupports.hop.hop-link)', { buffer = true })
    vim.keymap.set('n', '<C-d>', '<Plug>(neorg.tempus.insert-date)', { buffer = true })
  end,
})

vim.api.nvim_create_autocmd('Filetype', {
  pattern = 'make',
  callback = function()
    vim.opt_local.expandtab = false
  end,
})

-- User commands
vim.api.nvim_create_user_command('MasonInstallAll', function()
  vim.cmd 'MasonInstall csharp-language-server csharpier azure-pipelines-language-server jsonlint'
end, {})
