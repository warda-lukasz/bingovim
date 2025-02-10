local map = vim.keymap.set

-- Move to previous/next
map("n", "<C-PageUp>", "<Cmd>BufferPrevious<CR>", { noremap = true, silent = true, desc = "Previous Buffer" })
map("n", "<C-PageDown>", "<Cmd>BufferNext<CR>", { noremap = true, silent = true, desc = "Next Buffer" })

-- Re-order to previous/next
map('n', '<A-<>', '<Cmd>BufferMovePrevious<CR>', { noremap = true, silent = true, desc = "Move Buffer Left" })
map('n', '<A->>', '<Cmd>BufferMoveNext<CR>', { noremap = true, silent = true, desc = "Move Buffer Right" })

-- Goto buffer in position...
map('n', '<A-1>', '<Cmd>BufferGoto 1<CR>', { noremap = true, silent = true, desc = "Go to Buffer 1" })
map('n', '<A-2>', '<Cmd>BufferGoto 2<CR>', { noremap = true, silent = true, desc = "Go to Buffer 2" })
map('n', '<A-3>', '<Cmd>BufferGoto 3<CR>', { noremap = true, silent = true, desc = "Go to Buffer 3" })
map('n', '<A-4>', '<Cmd>BufferGoto 4<CR>', { noremap = true, silent = true, desc = "Go to Buffer 4" })
map('n', '<A-5>', '<Cmd>BufferGoto 5<CR>', { noremap = true, silent = true, desc = "Go to Buffer 5" })
map('n', '<A-6>', '<Cmd>BufferGoto 6<CR>', { noremap = true, silent = true, desc = "Go to Buffer 6" })
map('n', '<A-7>', '<Cmd>BufferGoto 7<CR>', { noremap = true, silent = true, desc = "Go to Buffer 7" })
map('n', '<A-8>', '<Cmd>BufferGoto 8<CR>', { noremap = true, silent = true, desc = "Go to Buffer 8" })
map('n', '<A-9>', '<Cmd>BufferGoto 9<CR>', { noremap = true, silent = true, desc = "Go to Buffer 9" })
map('n', '<A-0>', '<Cmd>BufferLast<CR>', { noremap = true, silent = true, desc = "Go to Last Buffer" })

-- Pin/unpin buffer
map('n', '<A-p>', '<Cmd>BufferPin<CR>', { noremap = true, silent = true, desc = "Pin Buffer" })

-- Close buffer
map('n', '<A-c>', '<Cmd>BufferClose<CR>', { noremap = true, silent = true, desc = "Close Buffer" })
map('n', '<leader>x', '<Cmd>BufferCloseAllButCurrent<CR>',
  { noremap = true, silent = true, desc = "Close All But Current Buffer" })
map('n', '<leader>xx', '<Cmd>BufferCloseAllButPinned<CR>',
  { noremap = true, silent = true, desc = "Close All But Pinned Buffers" })
