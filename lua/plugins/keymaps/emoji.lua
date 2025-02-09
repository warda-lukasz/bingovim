local ts = require('telescope').load_extension 'emoji'
local map = vim.keymap.set

map('n', '<leader>ie', ts.emoji, { desc = '[I]nsert [E]moji' })

