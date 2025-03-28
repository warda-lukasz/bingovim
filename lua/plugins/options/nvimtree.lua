-- NvimTree setup
require("nvim-tree").setup({
  hijack_cursor = true,
  modified = {
    enable = true,
  },
  view = {
    width = 45,
  },
  renderer = {
    add_trailing = true,
    hidden_display = "simple",
  },
  filters = {
    dotfiles = false,
    git_ignored = false,
  },
})

vim.cmd("NvimTreeOpen");
