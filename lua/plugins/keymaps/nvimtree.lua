local map = vim.keymap.set

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
