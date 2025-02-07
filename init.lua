-- Set leader key to space
vim.g.mapleader = " "
-- Setup lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

local sysargs = {"git", "clone", "--filter=blob:none","https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath}

if not vim.loop.fs_stat(lazypath) then
	local success, result = pcall(vim.fn.system, sysargs)
end

vim.opt.rtp:prepend(lazypath)
require("lazy").setup("plugins")
-- Load plugins
require("plugins.lsp")
require("plugins.styles")
-- Load keybindings
require("keymaps")
require("plugins.plugins")

-- Load options
require("options")
