return {
  {
    'folke/snacks.nvim',
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
      bufdelete = { enabled = true },
      dashboard = {
        enabled = true,
        preset = {
          -- Used by the `keys` section to show keymaps.
          -- Set your custom keymaps here.
          -- When using a function, the `items` argument are the default keymaps.
          ---@type snacks.dashboard.Item[]
          keys = {
            { icon = ' ', key = 'f', desc = 'Find File', action = ':Telescope frecency workspace=CWD path_display={"filename_first"}' },
            { icon = ' ', key = 't', desc = 'Find Text', action = ":lua Snacks.dashboard.pick('live_grep')" },
            { icon = '', key = 'e', desc = 'File Explorer', action = ':Neotree' },
            { icon = '', key = 'g', desc = 'Git', action = ':lua Snacks.lazygit.open()' },
            { icon = '', key = 's', desc = 'Restore Session', section = 'session' },
            { icon = '󰒲 ', key = 'l', desc = 'Lazy', action = ':Lazy', enabled = package.loaded.lazy ~= nil },
            { icon = '', key = 'm', desc = 'Mason', action = ':Mason', enabled = package.loaded.lazy ~= nil },
            { icon = ' ', key = 'q', desc = 'Quit', action = ':qa' },
          },
          header = [[
   ▄▄▄▄▀ ▄  █ ▄█    ▄▄▄▄▄       ▄█    ▄▄▄▄▄       ▄████  ▄█    ▄   ▄███▄   
▀▀▀ █   █   █ ██   █     ▀▄     ██   █     ▀▄     █▀   ▀ ██     █  █▀   ▀  
    █   ██▀▀█ ██ ▄  ▀▀▀▀▄       ██ ▄  ▀▀▀▀▄       █▀▀    ██ ██   █ ██▄▄    
   █    █   █ ▐█  ▀▄▄▄▄▀        ▐█  ▀▄▄▄▄▀        █      ▐█ █ █  █ █▄   ▄▀ 
  ▀        █   ▐                 ▐                 █      ▐ █  █ █ ▀███▀   
          ▀                                         ▀       █   ██         
      ]],
        },
        sections = {
          {
            section = 'terminal',
            cmd = 'cat | ~/downloads/thisisfine.sh',
            height = 25,
          },
          {
            pane = 2,
            { section = 'header' },
            { section = 'keys', gap = 1 },
          },
        },
      },
      -- explorer = { enabled = true },
      -- indent = {
      --   indent = {
      --     enabled = false,
      --   },
      --   chunk = {
      --     enabled = true,
      --     char = {
      --       horizontal = '─',
      --       vertical = '│',
      --       corner_top = '╭',
      --       corner_bottom = '╰',
      --       arrow = '─',
      --     },
      --   },
      -- },
      lazygit = { enabled = true },
      terminal = { enabled = true },
      scratch = {
        enabled = true,
        ft = function()
          return ''
          -- if vim.bo.buftype == '' and vim.bo.filetype ~= '' then
          --   return vim.bo.filetype
          -- end
          -- return 'markdown'
        end,
        filekey = {
          cwd = true, -- use current working directory
          branch = false, -- use current branch name
          count = true, -- use vim.v.count1
        },
      },
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
        '<leader>ss',
        function()
          Snacks.scratch()
        end,
        desc = 'Toggle Scratch Buffer',
      },
      {
        '<leader>sb',
        function()
          Snacks.scratch.select()
        end,
        desc = 'Select Scratch Buffer',
      },
      {
        '<leader>gg',
        function()
          Snacks.lazygit.open()
        end,
        desc = 'Lazy[G]it',
      },
      {
        '<leader>t',
        function()
          Snacks.terminal.toggle()
        end,
        desc = '[T]erminal',
      },
    },
  },
}
