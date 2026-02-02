-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
  },
  lazy = false,
  keys = {
    { '<leader>e', ':Neotree reveal toggle<CR>', desc = 'NeoTree', silent = true },
    { '<leader>bb', ':Neotree source=buffers position=right toggle<CR>', desc = '[B]uffers (NeoTree)', silent = true },
  },
  opts = {
    buffers = {
      show_unloaded = true,
    },
    default_component_configs = {
      git_status = {
        symbols = {
          -- Status type
          ignored = '',
          unstaged = '',
          staged = '',
        },
      },
    },
    filesystem = {
      window = {
        mappings = {
          -- Make the mapping anything you want
          ['e'] = 'easy',
        },
      },
      commands = {
        ['easy'] = function(state)
          local node = state.tree:get_node()
          local path = node.type == 'directory' and node.path or vim.fs.dirname(node.path)
          require('easy-dotnet').create_new_item(path, function()
            require('neo-tree.sources.manager').refresh(state.name)
          end)
        end,
      },
    },
  },
}
