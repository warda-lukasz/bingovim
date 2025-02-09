return {
  -- LSPConfig
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
  },
  config = function() 

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

