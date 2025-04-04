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
  { "EdenEast/nightfox.nvim" },
  { "catppuccin/nvim",       name = "catppuccin", priority = 1000 },
}
