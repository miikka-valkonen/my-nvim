return {
  {
    'rebelot/kanagawa.nvim',
    lazy = false,
    priority = 1000, -- Make sure to load this before all the other start plugins.
    config = function()
      -- NOTE: you do not need to call setup if you don't want to.
      require('kanagawa').setup {
        -- optional configuration here
      }
      -- Load the colorscheme here.
      -- Like many other themes, this one has different styles, and you could load
      -- any other, such as 'tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.
      vim.cmd.colorscheme 'kanagawa-dragon'
    end,
  },
  { -- You can easily change to a different colorscheme.
    -- Change the name of the colorscheme plugin below, and then
    -- change the command in the config to whatever the name of that colorscheme is.
    --
    -- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
    'metalelf0/black-metal-theme-neovim',
    event = 'VeryLazy',
    config = function()
      require('black-metal').setup {
        -- optional configusation here
        theme = 'mayhem',
      }

      -- Convenience function that simply calls `:colorscheme <theme>` with the theme
      -- specified in your config.
      -- require('black-metal').load()
    end,
  },
}
