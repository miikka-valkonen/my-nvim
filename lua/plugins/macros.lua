return {
  'chrisgrieser/nvim-recorder',
  opts = {
    logLevel = vim.log.levels.TRACE,
    lessNotifications = true,
    mapping = {
      startStopRecording = 'm',
      playMacro = 'M',
      switchSlot = '<C-m>',
      editMacro = 'cm',
      deleteAllMacros = 'dm',
      yankMacro = 'ym',
    },
  },
}
