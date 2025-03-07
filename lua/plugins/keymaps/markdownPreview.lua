local map = vim.keymap.set
map("n", "<leader>mp", ":MarkdownPreviewToggle<cr>", { noremap = true, silent = true, desc = "Markdown Preview" })
