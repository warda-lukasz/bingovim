--[[
  Neovim Configuration File
  This file contains core editor settings and options for Neovim
--]]

-- Enable NERD font for icons and symbols
vim.g.have_nerd_font = true

-- Enable true color support for better visual experience
vim.opt.termguicolors = true

-- Disable netrw (default file explorer)
vim.g.loaded_netrw = 1

-- Configure line numbers and indentation
vim.opt.number = true      -- Show absolute line numbers
vim.opt.breakindent = true -- Preserve indentation in wrapped lines

-- Set system clipboard integration (scheduled to avoid startup issues)
vim.schedule(function()
  vim.opt.clipboard = 'unnamedplus'
end)

-- Show which line your cursor is on
vim.opt.cursorline = true

-- Highlight when yanking (copying) text
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Enable persistent undo and smart case-sensitivity
vim.opt.undofile = true   -- Save undo history to file
vim.opt.ignorecase = true -- Case-insensitive searching
vim.opt.smartcase = true  -- Case-sensitive if search contains capitals

-- Configure UI elements and window behavior
vim.opt.signcolumn = 'yes' -- Always show sign column
vim.opt.splitright = true  -- Open vertical splits to the right
vim.opt.splitbelow = true  -- Open horizontal splits below

-- Performance settings
vim.opt.updatetime = 250 -- Decrease update time for better user experience
vim.opt.timeoutlen = 300 -- Decrease mapped sequence wait time

-- Indentation and whitespace settings
vim.opt.tabstop = 4 -- Number of spaces a tab counts for
vim.opt.softtabstop = 4 -- Number of spaces inserted for a tab
vim.opt.shiftwidth = 4 -- Number of spaces for each indent level
vim.opt.expandtab = true -- Convert tabs to spaces
vim.opt.autoindent = true -- Copy indent from current line when starting new line
vim.opt.list = true -- Show whitespace characters
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' } -- Define whitespace characters
vim.opt.endofline = true -- Ensure files end with a newline
vim.opt.fixendofline = true -- Fix files to end with newline

-- Search settings
vim.opt.ignorecase = true -- Ignore case when searching
vim.opt.smartcase = true  -- Override ignorecase when search includes capitals
vim.opt.hlsearch = false  -- Don't highlight all search matches
vim.opt.incsearch = true  -- Show search matches as you type

-- Scrolling and viewport settings
vim.opt.sidescrolloff = 8    -- Minimum number of columns to keep visible
vim.opt.inccommand = 'split' -- Show preview of substitutions in split window
vim.opt.cursorline = true    -- Highlight the current line
vim.opt.scrolloff = 10       -- Keep 10 lines visible above/below cursor

-- File-specific indentation settings
vim.api.nvim_create_autocmd({ "BufEnter", "BufNewFile" }, {
  pattern = { "*.lua", },
  callback = function()
    vim.opt.tabstop = 2
    vim.opt.softtabstop = 2
    vim.opt.shiftwidth = 2
  end
})

-- Restore cursor position when reopening files
vim.api.nvim_create_autocmd("BufReadPost", {
  pattern = "*",
  callback = function()
    if vim.fn.line("'\"") > 0 and vim.fn.line("'\"") <= vim.fn.line("$") then
      vim.cmd("normal! g`\"")
    end
  end
})

-- Set the color scheme
vim.cmd('colorscheme catppuccin-mocha')

-- Load plugin-specific configurations
require('plugins.options.aerial')        -- Outline/symbols viewer
require('plugins.options.copilotChat')   -- GitHub Copilot chat integration
require('plugins.options.nvimtree')      -- File explorer
require('plugins.options.treesitter')    -- Syntax highlighting and code analysis
require('plugins.options.emoji')         -- Emoji support
require('plugins.options.lsp')           -- Language Server Protocol settings
require('plugins.options.nvim-cmp')      -- Completion engine
require('plugins.options.gitsigns')      -- Git integration
-- require('plugins.options.conform')       -- Code formatting
require('plugins.options.todo-comments') -- TODO comment highlighting
