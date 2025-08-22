return {
  'iofq/dart.nvim',
  event = { 'BufReadPre', 'BufNewFile' },
  keys = function()
    local keys = {}

    for i = 1, 5 do
      table.insert(keys, {
        '<leader>' .. i,
        function()
          Dart.jump(tostring(i))
        end,
        desc = 'Dart: jump to ' .. i,
      })
    end
    return keys
  end,
  opts = {
    marklist = { '1', '2', '3', '4', '5' },
    buflist = { 't', 'n', 's', 'e' },
    -- Default mappings
    -- Set an individual mapping to an empty string to disable,
    mappings = {
      mark = '<leader>D', -- Mark current buffer
      jump = '<leader>d', -- Jump to buffer marked by next character i.e `;a`
      pick = '', -- Open Dart.pick
      next = '', -- Cycle right through the tabline
      prev = '', -- Cycle left through the tabline
    },
  },
}
