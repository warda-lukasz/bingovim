local lspconfig = require("lspconfig")

lspconfig.typos_lsp.setup({
  filetypes = {
    "text", "markdown", "latex", "tex", "html", "php", "javascript", "typescript", 
    "css", "scss", "twig", "yaml", "json", "lua", "bash"
  },
  init_options = {
    -- Możesz dostosować konfigurację, jeśli masz własny plik konfiguracyjny
    -- config = "path/to/config.toml",
    diagnosticSeverity = "warning",
  }
})
