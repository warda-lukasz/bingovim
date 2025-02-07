return {
	-- File tree
	{
		"nvim-tree/nvim-tree.lua",
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},
	-- Telescope (file finder)
	{
		"nvim-telescope/telescope.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
	},
	-- Treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			require("nvim-treesitter.configs").setup({
				ensure_installed = { 
					"typescript",
					"twig",
					"html", 
					"javascript", 
					"css", 
					"json", 
					"bash",
					"cmake",
					"csv",
					"php",
					"phpdoc",
					"lua",
					"python",
				},
				highlight = { 
					enable = true,  
					additional_vim_regex_gighlighting = false,
					disable = {},
				},
				indent = { enable = true },
			})
		end,
	},
	-- Which Key
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {},
	},
	-- BarBar
	{
		"romgrk/barbar.nvim",
		dependencies = {
			"lewis6991/gitsigns.nvim",
			"nvim-tree/nvim-web-devicons"
		},
		init = function() vim.g.barbar_auto_setup = false end,
		opts = {}
	},
	 --Copilot
	{
		"github/copilot.vim",
		config = function() 
			vim.g.copilot_node_command = "~/.nvm/versions/node/v18.20.6/bin/node"
		end,
	},
	-- CopilotChat
	{
	    "CopilotC-Nvim/CopilotChat.nvim",
	    dependencies = {
		{ "github/copilot.vim" },
		{ "nvim-lua/plenary.nvim" },
	    },
	    build = "make tiktoken",
      opts = {
        
      },
	},
	-- Auto-save
	{
		"pocco81/auto-save.nvim",
		config = function() 
			require("auto-save").setup({
				enabled = true,
				trigger_events = {
					"InsertLeave",
					"TextChanged",
					"FocusLost",
				},
				execution_message = {
					message = function()
						return ""
					end,
				},
				write_all_buffers = true,
			})
		end,
	},
	-- Comment code
  {
    'terrortylor/nvim-comment',
    config = function()
      require("nvim_comment").setup({ create_mappings = false })
    end
  },
	-- Preview markdown live in web browser
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle" },
    ft = { "markdown" },
    build = function() vim.fn["mkdp#util#install"]() end,
  },
  -- Render markdown
  {
      'MeanderingProgrammer/render-markdown.nvim',
      dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' },
      opts = {},
  },
  -- Indent blankline
  {
      "lukas-reineke/indent-blankline.nvim",
      main = "ibl",
      ---@module "ibl"
      ---@type ibl.config
      opts = {},
  },
  -- Gitsigns
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup()
    end,
  },
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
      bigfile = { enabled = true },
      dashboard = { enabled = true },
      explorer = { enabled = true },
      indent = { enabled = true },
      input = { enabled = true },
      picker = { enabled = true },
      notifier = { enabled = true },
      quickfile = { enabled = true },
      scope = { enabled = true },
      scroll = { enabled = true },
      statuscolumn = { enabled = true },
      words = { enabled = true },
    },
  },
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    opts = {},
  },
  -- Aerial
  {
    'stevearc/aerial.nvim',
    opts = {},
    -- Optional dependencies
    dependencies = {
       "nvim-treesitter/nvim-treesitter",
       "nvim-tree/nvim-web-devicons"
    },
  },
}
