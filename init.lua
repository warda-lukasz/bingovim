-- Enable true color support for better visual experience
vim.opt.termguicolors = true

-- Set leader key to space
vim.g.mapleader = " "
-- Setup lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

local sysargs = { "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable",
  lazypath }

---@diagnostic disable-next-line: undefined-field
if not vim.loop.fs_stat(lazypath) then
  ---@diagnostic disable-next-line: unused-local
  local success, result = pcall(vim.fn.system, sysargs)
end



vim.opt.rtp:prepend(lazypath)
local lazy = require("lazy")
lazy.setup("plugins")

-- Load options
require("options")

-- Load plugins
require("plugins.lsp")
require("plugins.styles")

-- Load keybindings
require("keymaps")
