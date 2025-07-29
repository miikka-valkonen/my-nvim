-- borrowed from hieulw/nvimrc
return {
  {
    'nvim-lualine/lualine.nvim',
    config = function()
      local lualine = require 'lualine'

      local filetype = { 'filetype', icon_only = true }

      local lsp_status = {
        'lsp_status',
        icon = '', -- f013
        symbols = {
          spinner = { '', '', '', '', '', '', '', '', '', '', '', '', '' },
          done = false,
          separator = ' ',
        },
        -- List of LSP names to ignore (e.g., `null-ls`):
        ignore_lsp = { 'copilot' },
      }

      local diagnostics = {
        'diagnostics',
        sources = { 'nvim_diagnostic' },
        sections = { 'error', 'warn', 'info', 'hint' },
        symbols = {
          error = ' ',
          hint = ' ',
          info = ' ',
          warn = ' ',
        },
        colored = true,
        update_in_insert = false,
        always_visible = false,
      }

      local diff = {
        'diff',
        source = function()
          local gitsigns = vim.b.gitsigns_status_dict
          if gitsigns then
            return {
              added = gitsigns.added,
              modified = gitsigns.changed,
              removed = gitsigns.removed,
            }
          end
        end,
        symbols = {
          added = '' .. ' ',
          modified = '' .. ' ',
          removed = '' .. ' ',
        },
        colored = true,
        always_visible = false,
      }

      lualine.setup {
        options = {
          theme = 'auto',
          globalstatus = true,
          section_separators = '',
          component_separators = '',
          disabled_filetypes = { 'mason', 'lazy', 'NvimTree' },
        },
        sections = {
          lualine_a = { 'mode' },
          lualine_b = {},
          lualine_c = { 'filename', lsp_status, 'copilot' },
          lualine_x = { require('recorder').recordingStatus },
          lualine_y = { diff, diagnostics, filetype },
          lualine_z = {},
        },
      }
    end,
  },
}
