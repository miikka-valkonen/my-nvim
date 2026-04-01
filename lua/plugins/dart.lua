local function close_unmarked_buffers()
  local state = Dart.state()
  local marklist = {}
  for _, mark in ipairs(Dart.config.marklist) do
    marklist[mark] = true
  end

  -- Build a set of filenames to keep (those with mark in marklist)
  local keep = {}
  for _, entry in ipairs(state) do
    if marklist[entry.mark] then
      keep[vim.fn.fnamemodify(entry.filename, ':p')] = true
    end
  end

  -- Iterate over all listed buffers
  for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
    local name = vim.api.nvim_buf_get_name(bufnr)
    if name ~= '' and not keep[name] then
      vim.api.nvim_buf_delete(bufnr, {})
    end
  end
end

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

    table.insert(keys, { '<leader>bu', close_unmarked_buffers, desc = 'Delete [U]nmarked' })
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
    tabline = {
      order = function()
        local order = {}
        for i, key in ipairs(vim.list_extend(vim.deepcopy(Dart.config.marklist), Dart.config.buflist)) do
          order[key] = i
        end
        return order
      end,
    },
  },
}
