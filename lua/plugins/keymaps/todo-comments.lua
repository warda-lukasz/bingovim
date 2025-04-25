local map = vim.keymap.set

map("n", "<leader>ot", '<Cmd>TodoQuickFix<CR>', { noremap = true, silent = true, desc = "List TODOs" })
