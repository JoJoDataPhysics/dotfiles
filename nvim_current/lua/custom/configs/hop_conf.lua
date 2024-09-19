local hop = require 'hop'
local directions = require('hop.hint').HintDirection
-- vim.keymap.set('', 'f', function()
--     hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true })
-- end, { remap = true })
-- vim.keymap.set('', 'F', function()
--     hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true })
-- end, { remap = true })
-- vim.keymap.set('', 't', function()
--     hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })
-- end, { remap = true })
-- vim.keymap.set('', 'T', function()
--     hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 })
-- end, { remap = true })
vim.keymap.set('', '<leader>ü', function()
  hop.hint_char1 { direction = directions.AFTER_CURSOR, current_line_only = false }
end, { desc = 'f whole text', remap = true })
vim.keymap.set('', '<leader>ö', function()
  hop.hint_char1 { direction = directions.AFTER_CURSOR, current_line_only = false, hint_offset = -1 }
end, { desc = 't whole text', remap = true })
vim.keymap.set('', '<leader>Ü', function()
  hop.hint_char1 { direction = directions.BEFORE_CURSOR, current_line_only = false }
end, { desc = 'f whole text bw', remap = true })
vim.keymap.set('', '<leader>Ö', function()
  hop.hint_char1 { direction = directions.BEFORE_CURSOR, current_line_only = false, hint_offset = -1 }
end, { desc = 't whole text bw', remap = true })
