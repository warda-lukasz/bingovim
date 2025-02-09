-- LSP config
--
local lspconfig = require("lspconfig")

lspconfig.intelephense.setup({
	settings = {
		intelephense = {
			files = {
				maxSize = 5000000 -- Increased limit for large files
			},
			environment = {
				phpVersion = "8.3"
			}
		}
	}
})
