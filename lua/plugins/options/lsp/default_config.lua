local capabilities = require('cmp_nvim_lsp').default_capabilities()

return {
  capabilities = capabilities,
  on_attach = function(client, bufnr)
    if client.server_capabilities.completionProvider then
      vim.bo[bufnr].omnifunc = 'v:lua.vim.lsp.omnifunc'
    end
  end
}
