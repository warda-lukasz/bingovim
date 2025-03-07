local lspconfig = require('lspconfig')
local default_config = require('plugins.options.lsp.default_config')

lspconfig.html.setup(vim.tbl_deep_extend("force", default_config, {
  settings = {
    html = {
      format = {
        enable = true,
      },
      validate = {
        scripts = true,
        styles = true,
      },
    },
  },
}))
