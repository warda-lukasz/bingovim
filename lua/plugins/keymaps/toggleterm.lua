local map        = vim.keymap.set
local Terminal   = require('toggleterm.terminal').Terminal
local vertical   = Terminal:new({ direction = "vertical", hidden = true })
local horizontal = Terminal:new({ direction = "horizontal", hidden = true })
local float      = Terminal:new({ direction = "float", hidden = true })

function _toggle_vertical()
  vertical:toggle()
end

function _toggle_horizontal()
  horizontal:toggle()
end

function _toggle_float()
  float:toggle()
end

map("n", "<leader>tv", "<cmd>lua _toggle_vertical()<CR>", { noremap = true, silent = true })
map("n", "<leader>th", "<cmd>lua _toggle_horizontal()<CR>", { noremap = true, silent = true })
map("n", "<leader>tf", "<cmd>lua _toggle_float()<CR>", { noremap = true, silent = true })
