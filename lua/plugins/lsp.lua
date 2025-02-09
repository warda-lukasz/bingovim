return {
  -- LSPConfig
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
	},
	config = function() 
		require("mason").setup()
		require("mason-lspconfig").setup({
			ensure_installed = { 
				"intelephense", -- PHP
				"cssls",        -- CSS
				"html",         -- HTML
				"eslint",       -- JavaScript, TypeScript linting
				"jsonls",       -- JSON
				"emmet_ls",     -- Emmet for HTML/CSS
				"tailwindcss",  -- Tailwind CSS
				"prismals",     -- Prisma
				"graphql",      -- GraphQL
				"yamlls",       -- YAML
				"bashls",       -- Bash
				"dockerls",     -- Docker
				"pyright",      -- Python
				"vuels",        -- Vue.js
				"angularls",    -- Angular
				"clangd",       -- C/C++
				"rust_analyzer",-- Rust
				"jdtls",        -- Java
				"omnisharp",    -- C#
				"phpactor",     -- PHP
			},
			automatic_installation = true,
		})
	end,
	opts = {
		servers = {
			intelephense  = {
				settings = {
					files = {
						maxSize = 1000000,
					},
					environment = {
						phpVersion = "8.3",
					},
				},
			},
			tsserver = {
				settings = {
					typescript = {
						format = {
							indentSize = 2,
							tabSize = 2,
						},
					},
					javascript = {
						format = {
							indentSize = 2,
							tabSize = 2,
						},
					},
				},
			},
			-- Add additional server configurations here if needed
		},
	},
  -- Autocompletion (cmp)
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-nvim-lsp',
      'L3MON4D3/LuaSnip',
    },
  }
}
