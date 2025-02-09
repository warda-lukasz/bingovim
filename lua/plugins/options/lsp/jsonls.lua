local lspconfig = require('lspconfig')
local default_config = require('lua.plugins.options.lsp.default_config')

lspconfig.jsonls.setup(vim.tbl_deep_extend("force", default_config, {
  settings = {
    json = {
      schemas = require('schemastore').json.schemas(),
      validate = { enable = true },
    },
  },
}))
