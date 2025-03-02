local map = vim.keymap.set

map('n', 'gd', vim.lsp.buf.definition, { desc = "Go to Definition" })
map('n', 'gr', vim.lsp.buf.references, { desc = "Go to References" })
map('n', 'K', vim.lsp.buf.hover, { desc = "Hover Documentation" })
map('n', '[d', vim.diagnostic.goto_prev, { desc = "Previous Diagnostic" })
map('n', ']d', vim.diagnostic.goto_next, { desc = "Next Diagnostic" })
map('n', '<A-CR>', vim.lsp.buf.code_action, { desc = "Code Action" })
map('n', '<leader>rn', vim.lsp.buf.rename, { desc = "Rename" })
map({ 'n', 'v' }, '<leader>l', vim.lsp.buf.format, { desc = "Format" })
