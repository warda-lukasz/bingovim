local map = vim.keymap.set
local gitsigns = require('gitsigns')
--
-- map('n', '<leader>hs', gitsigns.stage_hunk)
-- map('n', '<leader>hr', gitsigns.reset_hunk)
-- map('v', '<leader>hs', function()
--       gitsigns.stage_hunk({ vim.fn.line('.'), vim.fn.line('v') })
-- end)
-- map('v', '<leader>hr', function()
--   gitsigns.reset_hunk({ vim.fn.line('.'), vim.fn.line('v') })
-- end)
--
-- map('n', '<leader>hS', gitsigns.stage_buffer)
-- map('n', '<leader>hR', gitsigns.reset_buffer)
-- map('n', '<leader>hp', gitsigns.preview_hunk)
-- map('n', '<leader>hi', gitsigns.preview_hunk_inline)
-- map('n', '<leader>hb', function() gitsigns.blame_line({ full = true })
-- end)
--
map('n', '<leader>ghd', gitsigns.diffthis, { noremap = true , silent = true , desc = 'Diff this file' })
--
map('n', '<leader>ghD', function()
  gitsigns.diffthis('~')
end, { noremap = true , silent = true , desc = 'Diff this file against HEAD' })
--
-- map('n', '<leader>hQ', function() gitsigns.setqflist('all') end)
-- map('n', '<leader>hq', gitsigns.setqflist)

-- Toggles
map('n', '<leader>gtb', gitsigns.toggle_current_line_blame, { noremap = true , silent = true , desc = 'Toggle current line blame' })
map('n', '<leader>gtd', gitsigns.toggle_deleted, { noremap = true , silent = true , desc = 'Toggle deleted' })
map('n', '<leader>gtw', gitsigns.toggle_word_diff, { noremap = true , silent = true , desc = 'Toggle word diff' })

-- -- Text object
-- map({'o', 'x'}, 'ih', gitsigns.select_hunk)

