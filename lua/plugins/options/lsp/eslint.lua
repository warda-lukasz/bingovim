local lspconfig = require('lspconfig')
local default_config = require('plugins.options.lsp.default_config')

lspconfig.eslint.setup(vim.tbl_deep_extend("force", default_config, {
  settings = {
    workingDirectory = { mode = "auto" },
    format = true,
    quiet = false,
    onIgnoredFiles = "off",
    rulesCustomizations = {},
    run = "onType",
    validate = "on",
  },
  on_attach = function(client, bufnr)
    -- Automatyczne fixowanie przy zapisie
    vim.api.nvim_create_autocmd("BufWritePre", {
      buffer = bufnr,
      command = "EslintFixAll",
    })
  end,
}))
