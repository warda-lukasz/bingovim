local lspconfig = require('lspconfig')
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
  },
  automatic_installation = true,
})

-- Konfiguracja intelephense
lspconfig.intelephense.setup{
  settings = {
    intelephense = {
      stubs = {
        "apache", "bcmath", "bz2", "calendar", "composite",
        "curl", "date", "dom", "fileinfo", "filter", "ftp", 
        "gd", "gettext", "hash", "iconv", "imap", "intl", 
        "json", "ldap", "libxml", "mbstring", "mcrypt", 
        "mysql", "mysqli", "password", "pcntl", "pcre", 
        "PDO", "pdo_mysql", "Phar", "readline", "recode", 
        "Reflection", "session", "SimpleXML", "soap", "sockets", 
        "sodium", "SPL", "standard", "superglobals", "tokenizer", 
        "xml", "xdebug", "xmlreader", "xmlwriter", "yaml", "zip", 
        "zlib"
      },
      environment = {
        phpVersion = "8.3" -- ustaw odpowiednią wersję PHP
      }
    }
  }
}
