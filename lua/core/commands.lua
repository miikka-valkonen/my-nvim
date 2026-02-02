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

    for _, win in ipairs(vim.api.nvim_list_wins()) do
      local buf = vim.api.nvim_win_get_buf(win)
      local ft = vim.api.nvim_get_option_value('filetype', { buf = buf })
      if ft == 'dbui' or ft == 'dbout' or ft == 'codecompanion' then
        vim.api.nvim_win_close(win, true)
      end
    end

    for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
      if vim.api.nvim_buf_is_loaded(bufnr) then
        local ft = vim.api.nvim_get_option_value('filetype', { buf = bufnr })
        if ft == 'sql' then
          vim.api.nvim_buf_delete(bufnr, { force = true })
        end
      end
    end
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
  pattern = 'make',
  callback = function()
    vim.opt_local.expandtab = false
  end,
})

vim.api.nvim_create_autocmd('FileType', {
  pattern = 'fsharp',
  callback = function()
    vim.bo.commentstring = '// %s'
  end,
})

vim.api.nvim_create_autocmd('FileType', {
  pattern = 'csv',
  callback = function()
    vim.api.nvim_buf_set_keymap(
      0,
      'n',
      '<C-d>',
      ":pu=strftime('%a %d %b %Y')<CR>A;0920;1550;toimistolla, matkat 1000-1030 & 1350-1420",
      { noremap = true, silent = true }
    )
  end,
})

-- User commands
vim.api.nvim_create_user_command('MasonInstallAll', function()
  -- these have problems:
  -- azure-pipelines-language-server jsonlint
  vim.cmd 'MasonInstall csharp-language-server csharpier netcoredbg bicep-lsp'
end, {})
