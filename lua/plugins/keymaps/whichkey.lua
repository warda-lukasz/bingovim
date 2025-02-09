local map = vim.keymap.set

map("n", "<leader>wk", function() 
	require("which-key").show({ global = false })

end, { noremap = true, silent = true, desc = "Buffer local Keymaps (which-key)"})
