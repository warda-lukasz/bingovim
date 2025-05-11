-- Definiuj globalną zmienną vim lokalnie, aby zapobiec ostrzeżeniom
local vim = vim

-- Konfiguracja Mason
require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = {
    "intelephense",           -- PHP
    "cssls",                  -- CSS
    "html",                   -- HTML
    "eslint",                 -- JavaScript, TypeScript linting
    "jsonls",                 -- JSON
    "emmet_ls",               -- Emmet for HTML/CSS
    "yamlls",                 -- YAML
    "bashls",                 -- Bash
    "dockerls",               -- Docker
    "angularls",              -- Angular
    "lua_ls",                 -- Lua
    "ts_ls",                  -- TypeScript
    "marksman",               -- Markdown
    "typos_lsp",              -- Typos
    "twiggy_language_server", -- Twig
  },
  automatic_installation = true,
  automatic_enable = true,
})

require("plugins.options.lsp.intelephense")
