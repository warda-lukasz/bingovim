require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = {
    "phpactor",              -- PHP
    "cssls",                 -- CSS
    "html",                  -- HTML
    "eslint",                -- JavaScript, TypeScript linting
    "jsonls",                -- JSON
    "emmet_ls",              -- Emmet for HTML/CSS
    "yamlls",                -- YAML
    "bashls",                -- Bash
    "dockerls",              -- Docker
    "angularls",             -- Angular
    "lua_ls",                -- Lua
    "twiggy_language_server",-- Twig
    "ts_ls",                 -- TypeScript
    -- "eslint",                -- TypeScript
  },
  automatic_installation = true,
})

-- Load LSPs configurations
require("plugins.options.lsp.phpactor")
require("plugins.options.lsp.luals")
require("plugins.options.lsp.dockerls")
require("plugins.options.lsp.yamlls")
require("plugins.options.lsp.jsonls")
require("plugins.options.lsp.html")
require("plugins.options.lsp.cssls")
require("plugins.options.lsp.bashls")
require("plugins.options.lsp.twiggy_language_server")
require("plugins.options.lsp.ts_ls")
-- require("plugins.options.lsp.eslint")
