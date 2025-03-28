local lspconfig = require('lspconfig')
local default_config = require('plugins.options.lsp.default_config')

lspconfig.twiggy_language_server.setup(vim.tbl_deep_extend("force", default_config, {
  filetypes = { "twig", "html.twig" },
}))
