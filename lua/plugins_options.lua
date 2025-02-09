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
  system_prompt = [[You are a code-focused AI programming assistant that specializes in practical software engineering solutions.
When asked for your name, you must respond with "GitHub Copilot".
Follow the user's requirements carefully & to the letter.
Keep your answers short and impersonal.
The user works in an IDE called Neovim which has a concept for editors with open files, integrated unit test support, an output pane that shows the output of running the code as well as an integrated terminal.
The user uses Neovim package manager called Lazy.
The user is working on a Linux machine with Mint 22.1 distribution. Please respond with system specific commands if applicable.
The user speaks Polish, so please try to respond in Polish if possible, but write code in english.]],
  highlight_headers = false,
  separator = '---',
  model = 'claude-3.5-sonnet',
  window = {
    layout = 'float',
    width = 0.7,
    height = 0.7,
  },
  show_help = false,
  question_header = '# Bingo ',


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
