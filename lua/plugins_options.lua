-- Enable Treesitter highlighting for PHP files
vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "*.php",
  callback = function()
	vim.opt.textwidth = 79
	vim.opt.colorcolumn = "79"
	vim.cmd("TSEnable highlight")
  end,
})

-- NvimTree setup
require("nvim-tree").setup({
	view = {
		width = 40,
	},
})

vim.cmd("NvimTreeOpen");

-- Registers copilot-chat filetype for markdown rendering
require('render-markdown').setup({
  file_types = { 'markdown', 'copilot-chat' },
})

-- vim.opt.completeopt:append({ "noinsert", "popup"})

require('CopilotChat').setup({
  highlight_headers = false,
  separator = '---',
  error_header = '> [!ERROR] Error',
  model = 'claude-3.5-sonnet',
  window = {
    layout = 'horizontal',
  },
})

require('aerial').setup({
  layout = {
    default_direction = "right",
    width = 30
  },
  filter_kind = {
    "Class",
    "Constructor",
    "Function",
    "Method",
    "Property",
    -- Add these for PHP and TypeScript/React support
    "Variable", -- For PHP properties
    "Interface",
    "Constant",
    "Component", -- For React components
  },
  -- Add language-specific settings
  typescript = {
    -- Helps with TSX files
    icons = {
      Component = "󰅲 ",
    },
  },
  -- PHP specific settings
  php = {
    -- Ensure PHP properties are detected
    attach_mode = "global",
    show_variable_as_property = true,
  },
})
