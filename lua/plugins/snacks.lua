return {
  {
    'folke/snacks.nvim',
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
      bufdelete = { enabled = true },
      dashboard = { enabled = true },
      -- explorer = { enabled = true },
      indent = {
        indent = {
          enabled = false,
        },
        chunk = {
          enabled = true,
          char = {
            horizontal = '─',
            vertical = '│',
            corner_top = '╭',
            corner_bottom = '╰',
            arrow = '─',
          },
        },
      },
      lazygit = { enabled = true },
      -- input = { enabled = true },
      -- picker = { enabled = true },
      -- notifier = { enabled = true },
      -- quickfile = { enabled = true },
      -- scope = { enabled = true },
      -- scroll = { enabled = true },
      -- statuscolumn = { enabled = true },
      -- words = { enabled = true },
    },
    keys = {
      {
        '<leader>bd',
        function()
          Snacks.bufdelete()
        end,
        desc = '[D]elete current',
      },
      {
        '<leader>bo',
        function()
          Snacks.bufdelete.other()
        end,
        desc = 'Delete [O]thers',
      },
      {
        '<leader>ba',
        function()
          Snacks.bufdelete.all()
        end,
        desc = 'Delete [A]ll',
      },
      {
        '<leader>gg',
        function()
          Snacks.lazygit.open()
        end,
        desc = 'Lazy[G]it',
      },
    },
  },
}
