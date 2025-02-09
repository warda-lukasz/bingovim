local map = vim.keymap.set

map({"n", "v"}, "<leader>/", ":CommentToggle<cr>", { noremap = true, silent = true, desc = "Toggle Comment" })
