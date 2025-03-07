-- Enable Treesitter highlighting for PHP files
vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "*.php",
  callback = function()
    vim.opt.textwidth = 80
    vim.opt.colorcolumn = "80"
    vim.cmd("TSEnable highlight")
  end,
})
