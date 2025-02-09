local map = vim.keymap.set

local dbee = require("dbee")
map("n", "<leader>db", function() dbee.toggle() end, { noremap = true, silent = true, desc = "Open Dbee" })
