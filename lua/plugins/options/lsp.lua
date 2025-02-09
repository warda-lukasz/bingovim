
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
    "rust_analyzer",-- Rust
    "lua_ls",-- Lua
  },
  automatic_installation = true,
})

local capabilities = require('cmp_nvim_lsp').default_capabilities()
local lspconfig = require('lspconfig')

-- Podstawowa konfiguracja dla wszystkich serwerów
local default_config = {
  capabilities = capabilities,
  on_attach = function(client, bufnr)
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
  end
}

-- Konfiguracja poszczególnych serwerów
lspconfig.intelephense.setup(vim.tbl_deep_extend("force", default_config, {
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
      diagnostics = { enable = true }
    }
  }
}))
