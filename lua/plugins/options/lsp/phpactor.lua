local lspconfig = require('lspconfig')
local default_config = require('lua.plugins.options.lsp.default_config')

lspconfig.phpactor.setup(vim.tbl_deep_extend("force", default_config, {
  settings = {
    phpactor = {
      -- Podstawowa konfiguracja phpactora
      language_server_phpstan = {
        enabled = true
      },
      language_server_psalm = {
        enabled = false
      },
      completion = {
        enabled = true
      },
      indexer = {
        enabled = true
      }
    }
  }
}))
