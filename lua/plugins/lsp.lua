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
        "pyright",      -- PythCn
        "vuels",        -- Vue.js
        "angularls",    -- Angular
        "clangd",       -- C/C++
        "rust_analyzer",-- Rust
        "jdtls",        -- Java
        "omnisharp",    -- C#
      },
      automatic_installation = true,
    })

    local capabilities = require('cmp_nvim_lsp').default_capabilities()
    local on_attach = function(client, bufnr)
      -- Enable completion triggered by <c-x><c-o>
      vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
    end

    -- Konfiguracja intelephense
    local lspconfig = require('lspconfig')
    lspconfig.intelephense.setup({
      capabilities = capabilities,
      on_attach = on_attach,
      settings = {
        intelephense = {
          stubs = {
            "apache", "bcmath", "bz2", "calendar", "com_dotnet", "Core", "curl", "date",
            "dba", "dom", "enchant", "exif", "FFI", "fileinfo", "filter", "fpm",
            "ftp", "gd", "gettext", "gmp", "hash", "iconv", "imap", "intl", "json",
            "ldap", "libxml", "mbstring", "meta", "mysqli", "oci8", "odbc", "openssl",
            "pcntl", "pcre", "PDO", "pdo_mysql", "pdo_pgsql", "pdo_sqlite", "pgsql",
            "Phar", "posix", "pspell", "readline", "Reflection", "session", "shmop",
            "SimpleXML", "snmp", "soap", "sockets", "sodium", "SPL", "sqlite3", "standard",
            "superglobals", "sysvmsg", "sysvsem", "sysvshm", "tidy", "tokenizer", "xml",
            "xmlreader", "xmlrpc", "xmlwriter", "xsl", "Zend OPcache", "zip", "zlib"
          },
          diagnostics = {
            enable = true
          }
        }
      }
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

