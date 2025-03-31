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
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
  { "rebelot/kanagawa.nvim", name="kanagawa"},
}
