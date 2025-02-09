map = vim.keymap.set
opts = { noremap = true, silent = true }

-- barbar
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
map('n', '<A-0>', '<Cmd>BufferLast<CR>',  { noremap = true, silent = true, desc = "Go to Last Buffer" })
-- Pin/unpin buffer
map('n', '<A-p>', '<Cmd>BufferPin<CR>', { noremap = true, silent = true, desc = "Pin Buffer" })
-- Close buffer
map('n', '<A-c>', '<Cmd>BufferClose<CR>', { noremap = true, silent = true, desc = "Close Buffer" })
map('n', '<leader>x', '<Cmd>BufferCloseAllButCurrent<CR>', { noremap = true, silent = true, desc = "Close All But Current Buffer" })
map('n', '<leader>xx', '<Cmd>BufferCloseAllButPinned<CR>', { noremap = true, silent = true, desc = "Close All But Pinned Buffers" })

-- copilotchat
map("n", "<S-c>", "<cmd>CopilotChatToggle<CR>", { noremap = true, silent = true, desc = "Open Copilot Chat" })
map("n", "<S-m>", "<cmd>CopilotChatModels<CR>", { noremap = true, silent = true, desc = "Select Copilot Model" })
map("n", "<S-x>", "<cmd>CopilotChatReset<CR>", { noremap = true, silent = true, desc = "Reset Copilot Chat" })

--lsC
map('n', 'gd', vim.lsp.buf.definition, { desc = "Go to Definition" })
map('n', 'gr', vim.lsp.buf.references, { desc = "Go to References" })
map('n', 'K', vim.lsp.buf.hover, { desc = "Hover Documentation" })
map('n', '[d', vim.diagnostic.goto_prev, { desc = "Previous Diagnostic" })
map('n', ']d', vim.diagnostic.goto_next, { desc = "Next Diagnostic" })
map('n', '<leader>ca', vim.lsp.buf.code_action, { desc = "Code Action" })
map('n', '<leader>rn', vim.lsp.buf.rename, { desc = "Rename" })

-- nvimtree
map("n", "<leader>e", function() 
  local view = require("nvim-tree.view")
  if view.is_visible() then
    if vim.bo.filetype == "NvimTree" then
      vim.cmd("NvimTreeClose")
    else
      vim.cmd("NvimTreeFindFile")
    end
  else
    vim.cmd("NvimTreeOpen")
  end
end, { noremap = true, silent = true, desc = "Toggle NvimTree" })

-- telescope
local builtin = require("telescope.builtin")
map("n", "<leader>ff", builtin.find_files, { desc = "Find Files" })
map("n", "<leader>fg", builtin.live_grep, { desc = "Live Grep" })

-- whichkey
map("n", "<leader>wk", function() 
	require("which-key").show({ global = false })

end, { noremap = true, silent = true, desc = "Buffer local Keymaps (which-key)"})

-- -- markdown preview
-- map("n", "<leader>mp", ":MarkdownPreviewToggle<cr>", { noremap = true, silent = true, desc = "Markdown Preview" })

-- nvim-comment
map({"n", "v"}, "<leader>/", ":CommentToggle<cr>", { noremap = true, silent = true, desc = "Toggle Comment" })

-- copilot
map("n", "<leader>cp", "<cmd>Copilot panel<CR>", { noremap = true, silent = true, desc = "Open Copilot Panel" })


-- toggleterm
local Terminal  = require('toggleterm.terminal').Terminal
local vertical = Terminal:new({ direction = "vertical", hidden = true })
local horizontal = Terminal:new({ direction = "horizontal", hidden = true })
local float = Terminal:new({ direction = "float", hidden = true })

function _toggle_vertical()
  vertical:toggle()
end

function _toggle_horizontal()
  horizontal:toggle()
end

function _toggle_float()
  float:toggle()
end

map("n", "<leader>tv", "<cmd>lua _toggle_vertical()<CR>", {noremap = true, silent = true})
map("n", "<leader>th", "<cmd>lua _toggle_horizontal()<CR>", {noremap = true, silent = true})
map("n", "<leader>tf", "<cmd>lua _toggle_float()<CR>", {noremap = true, silent = true})

-- lazy git
local lazygit = Terminal:new({ cmd = "lazygit", hidden = true , direction = "float"})

function _lazygit_toggle()
  lazygit:toggle()
end

map("n", "<leader>lg", "<cmd>lua _lazygit_toggle()<CR>", {noremap = true, silent = true})

-- aerial
map("n", "<leader>w", "<cmd>AerialToggle<CR>", { noremap = true, silent = true, desc = "Toggle Aerial" })
