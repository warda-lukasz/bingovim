-- Enable NERD font
vim.g.have_nerd_font = true

-- Disable netrw
vim.g.loaded_netrw = 1

-- Show line numbers
vim.opt.number = true
-- vim.opt.relativenumber = true

-- Set tab options
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.autoindent = true
-- vim.opt.list = true

vim.opt.ignorecase = true -- ignore case when searching
vim.opt.smartcase = true  -- unless capital letter in search

vim.opt.hlsearch = false  -- do not highlight all matches on previous search pattern
vim.opt.incsearch = true  -- incrementally highlight searches as you type

-- Enable true color support
vim.opt.termguicolors = true

-- Set minimum number of lines to keep above and below the cursor
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8

-- Set tab options for specific file types
vim.api.nvim_create_autocmd({ "BufEnter", "BufNewFile" }, {
  pattern = { "*.js", "*.html", "*.css", "*.lua", "*.json", "*.ts", "*.tsx" },
  callback = function()
    vim.opt.tabstop = 2
    vim.opt.softtabstop = 2
    vim.opt.shiftwidth = 2
  end
})

-- vim.filetype.add()

-- Return to last edit position when opening files
vim.api.nvim_create_autocmd("BufReadPost", {
  pattern = "*",
  callback = function()
    if vim.fn.line("'\"") > 0 and vim.fn.line("'\"") <= vim.fn.line("$") then
      vim.cmd("normal! g`\"")
    end
  end
})

-- Set colorscheme
vim.cmd('colorscheme catppuccin-macchiato')

-- Load Plugins Options
require('plugins.options.aerial')
require('plugins.options.copilotChat')
require('plugins.options.nvimtree')
require('plugins.options.treesitter')
require('plugins.options.emoji')
require('plugins.options.lsp')
require('plugins.options.nvim-cmp')
require('plugins.options.gitsigns')
require('plugins.options.conform')
