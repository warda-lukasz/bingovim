local map = vim.keymap.set

map("n", "<S-c>", "<cmd>CopilotChatToggle<CR>", { noremap = true, silent = true, desc = "Open Copilot Chat" })
map("n", "<S-m>", "<cmd>CopilotChatModels<CR>", { noremap = true, silent = true, desc = "Select Copilot Model" })
map("n", "<S-x>", "<cmd>CopilotChatReset<CR>", { noremap = true, silent = true, desc = "Reset Copilot Chat" })
