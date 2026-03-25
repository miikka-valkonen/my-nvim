-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim
local function copy_path(state)
  -- NeoTree is based on [NuiTree](https://github.com/MunifTanjim/nui.nvim/tree/main/lua/nui/tree)
  -- The node is based on [NuiNode](https://github.com/MunifTanjim/nui.nvim/tree/main/lua/nui/tree#nuitreenode)
  local node = state.tree:get_node()
  local filepath = node:get_id()
  local filename = node.name
  local modify = vim.fn.fnamemodify

  local results = {
    filepath,
    modify(filepath, ':.'),
    modify(filepath, ':~'),
    filename,
    modify(filename, ':r'),
    modify(filename, ':e'),
  }

  vim.ui.select({
    '1. Absolute path: ' .. results[1],
    '2. Path relative to CWD: ' .. results[2],
    '3. Path relative to HOME: ' .. results[3],
    '4. Filename: ' .. results[4],
    '5. Filename without extension: ' .. results[5],
    '6. Extension of the filename: ' .. results[6],
  }, { prompt = 'Choose to copy to clipboard:' }, function(choice)
    if choice then
      local i = tonumber(choice:sub(1, 1))
      if i then
        local result = results[i]
        vim.fn.setreg('+', result)
        vim.notify('Copied: ' .. result)
      else
        vim.notify 'Invalid selection'
      end
    else
      vim.notify 'Selection cancelled'
    end
  end)
end

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
          ['Y'] = copy_path,
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
