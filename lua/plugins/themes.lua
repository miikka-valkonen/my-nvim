return {
  {
    'RRethy/base16-nvim',
    lazy = false,
    priority = 1000, -- Make sure to load this before all the other start plugins.
    config = function()
      require('base16-colorscheme').setup {
        -- base16-framer
        base00 = '#181818', -- background
        base01 = '#151515', -- lighter background
        base02 = '#464646', -- selection background
        base03 = '#747474', -- comments / invisibles
        base04 = '#b9b9b9', -- dark foreground
        base05 = '#d0d0d0', -- default foreground
        base06 = '#e8e8e8', -- light foreground
        base07 = '#eeeeee', -- light background
        base08 = '#fd886b', -- variables / XML tags
        base09 = '#fc4769', -- integers / booleans
        base0A = '#fecb6e', -- classes / bold
        base0B = '#32ccdc', -- strings
        base0C = '#acddfd', -- support / regex
        base0D = '#d0d0d0', -- functions / methods
        base0E = '#ba8cfc', -- keywords
        base0F = '#b15f4a', -- deprecated
      }

      vim.api.nvim_set_hl(0, 'TelescopeBorder', { fg = '#888888' })
      vim.api.nvim_set_hl(0, 'TelescopeResultsTitle', { fg = '#d0d0d0' })
      vim.api.nvim_set_hl(0, 'TelescopePromptTitle', { fg = '#d0d0d0' })
      vim.api.nvim_set_hl(0, 'TelescopePreviewTitle', { fg = '#d0d0d0' })
      vim.api.nvim_set_hl(0, 'TelescopePromptNormal', { bg = '#181818' })
      vim.api.nvim_set_hl(0, 'TelescopePromptBorder', { fg = '#888888', bg = '#181818' })
      vim.api.nvim_set_hl(0, 'TelescopePromptPrefix', { bg = '#181818' })
    end,
  },
}
