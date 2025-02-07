return {
	-- Tokyonight
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {
			style = "night",
		},
	},
	-- OneDark
	{
		"navarasu/onedark.nvim",
		init = function()
			require("onedark").setup {
				style = "darker",
			}
			require("onedark").load()
		end,
	},
}
