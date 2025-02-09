local lspconfig = require('lspconfig')
local default_config = require('lua.plugins.options.lsp.default_config')

lspconfig.dockerls.setup(vim.tbl_deep_extend("force", default_config, {
  settings = {
    docker = {
      languageserver = {
        diagnostics = {
          enable = true,
        },
      },
    },
  },
}))
