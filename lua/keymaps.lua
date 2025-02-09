local map = vim.keymap.set

-- save&quit
map("n", "<leader>wq", "<cmd>wqa<CR>", { noremap = true, silent = true, desc = "Save&Quit" })
map("n", "<leader>q", "<cmd>q<CR>", { noremap = true, silent = true, desc = "Quit" })
map("n", "<leader>s", "<cmd>w<CR>", { noremap = true, silent = true, desc = "Save" })

-- pane move
map("n", "<C-Left>", "<C-w>h", { noremap = true, silent = true, desc = "Move to left pane" })
map("n", "<C-Down>", "<C-w>j", { noremap = true, silent = true, desc = "Move to bottom pane" })
map("n", "<C-Up>", "<C-w>k", { noremap = true, silent = true, desc = "Move to top pane" })
map("n", "<C-Right>", "<C-w>l", { noremap = true, silent = true, desc = "Move to right pane" })

-- pane resize
map("n", "<A-Right>", ":vertical resize +5<CR>", { noremap = true, silent = true, desc = "Pane Resize Horizontal" })
map("n", "<A-Left>", ":vertical resize -5<CR>", { noremap = true, silent = true, desc = "Pane Resize Horizontal" })
map("n", "<A-Up>", ":resize +5<CR>", { noremap = true, silent = true, desc = "Pane Resize Vertical" })
map("n", "<A-Down>", ":resize +5<CR>", { noremap = true, silent = true, desc = "Pane Resize Vertical" })

-- pane split
map("n", "<leader>vs", "<cmd>vsplit<CR>", { noremap = true, silent = true, desc = "Vertical Split" })
map("n", "<leader>hs", "<cmd>split<CR>", { noremap = true, silent = true, desc = "Horizontal Split" })

-- yank to clipboard
map({"n", "v"}, "<leader>y", [["+y]])

-- load plugins
require('plugins.keymaps.aerial')
require('plugins.keymaps.barbar')
require('plugins.keymaps.copilot')
require('plugins.keymaps.copilotChat')
require('plugins.keymaps.lazygit')
require('plugins.keymaps.lsp')
require('plugins.keymaps.markdownPreview')
require('plugins.keymaps.nvim-comment')
require('plugins.keymaps.nvimtree')
require('plugins.keymaps.telescope')
require('plugins.keymaps.whichkey')
require('plugins.keymaps.emoji')
