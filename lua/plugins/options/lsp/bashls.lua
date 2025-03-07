local lspconfig = require('lspconfig')
local default_config = require('plugins.options.lsp.default_config')

lspconfig.bashls.setup(vim.tbl_deep_extend("force", default_config, {
  settings = {
    bashls = {
      enableSourceCodeParsing = true,
      shellcheck = {
        enable = true,
      },
    },
  },
}))
