-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>xq', vim.diagnostic.setloclist, { desc = '[Q]uickfix list' })

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

vim.keymap.set('n', '<TAB>', '<cmd>bn!<CR>', {}) -- Switch to next buffer
vim.keymap.set('n', '<S-TAB>', '<cmd>bp!<CR>', {}) -- Switch to previous buffer

vim.keymap.set('n', '<leader>w', '<cmd>vsplit<CR>', { desc = 'Split [W]indow' })
vim.keymap.set('n', '<C-C>', '<C-W>c', { desc = 'Close current window' })

-- Terminal keymaps
-- Add smooth window navigation
vim.keymap.set('t', '<C-h>', '<C-\\><C-N><C-w>h')
vim.keymap.set('t', '<C-j>', '<C-\\><C-N><C-w>j')
vim.keymap.set('t', '<C-k>', '<C-\\><C-N><C-w>k')
vim.keymap.set('t', '<C-l>', '<C-\\><C-N><C-w>l')
-- Exit terminal mode
vim.keymap.set('t', '<ESC>', '<C-\\><C-N>')
vim.keymap.set('t', 'jk', '<C-\\><C-N>')
vim.keymap.set('n', '<leader>T', '<Cmd>!tmux new-window -c ' .. vim.fn.getcwd() .. '<CR>', { desc = 'New [T]mux window', silent = true })

-- Quickly exit from insert mode
vim.keymap.set('i', 'jk', '<ESC>')

-- Stay in indent mode
vim.keymap.set('v', '<', '<gv')
vim.keymap.set('v', '>', '>gv')

vim.keymap.set('n', '<leader>cW', function()
  vim.cmd '%s/\r//g'
end, { desc = 'Replace [W]indows line endings' })

vim.keymap.set('n', '<leader>q', '<cmd>qa<CR>', { desc = '[Q]uit Neovim' })
vim.keymap.set('n', '<C-s>', '<cmd>w<CR>')

-- Run menu
vim.keymap.set(
  'n',
  '<leader>rf',
  '<Cmd>!tmux new-window -S -c ' .. vim.fn.getcwd() .. '/src/AzureFunctions -n func "func start"<CR>',
  { desc = 'Run [F]unction app', silent = true }
)

-- Work items menu
vim.keymap.set(
  'n',
  '<leader>wd',
  '<Cmd>!print_branch.sh | xargs az boards work-item show --fields System.Description --expand none --id | jq -r \'."fields"."System.Description"\' | tidy -iq -xml<CR>',
  { desc = '[D]escription', silent = true }
)
vim.keymap.set(
  'n',
  '<leader>wa',
  '<Cmd>!print_branch.sh | xargs az boards work-item show --fields Microsoft.VSTS.Common.AcceptanceCriteria --expand none --id | jq -r \'."fields"."Microsoft.VSTS.Common.AcceptanceCriteria"\' | tidy -iq -xml<CR>',
  { desc = '[A]cceptanceCriteria', silent = true }
)
vim.keymap.set(
  'n',
  '<leader>wo',
  '<Cmd>!print_branch.sh | xargs az boards work-item show --expand none --fields id,System.TeamProject --open --id<CR>',
  { desc = '[O]pen', silent = true }
)
