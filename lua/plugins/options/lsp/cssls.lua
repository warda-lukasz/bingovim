local lspconfig = require('lspconfig')
local default_config = require('plugins.options.lsp.default_config')

lspconfig.cssls.setup(vim.tbl_deep_extend("force", default_config, {
  settings = {
    css = {
      validate = true,
      lint = {
        compatibleVendorPrefixes = "warning",
        vendorPrefix = "warning",
        duplicateProperties = "warning",
      },
    },
  },
}))
