local lspconfig = require('lspconfig')
local default_config = require('plugins.options.lsp.default_config')

lspconfig.yamlls.setup(vim.tbl_deep_extend("force", default_config, {
  settings = {
    yaml = {
      format = {
        enable = true,
      },
      validate = true,
      schemas = {
        ["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
        ["https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json"] =
        "docker-compose*.yml",
      },
    },
  },
}))
