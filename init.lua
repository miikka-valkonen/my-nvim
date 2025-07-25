vim.g.mapleader = ' '
vim.g.maplocalleader = ','

-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true

require 'core.options'
require 'core.keymaps'
require 'core.commands'
require 'core.lazy-bootstrap'
require 'core.lazy-plugins'
