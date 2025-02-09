local lspconfig = require('lspconfig')
local default_config = require('lua.plugins.options.lsp.default_config')

lspconfig.twiggy_ls.setup(vim.tbl_deep_extend("force", default_config, {
  filetypes = { "twig" },
}))
