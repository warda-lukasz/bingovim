require('aerial').setup({
  layout = {
    default_direction = "right",
    width = 30
  },
  -- Display all symbols
  filter_kind = false,
  -- Add language-specific settings
  typescript = {
    -- Helps with TSX files
    icons = {
      Component = "󰅲 ",
    },
  },
  -- PHP specific settings
  php = {
    -- Ensure PHP properties are detected
    attach_mode = "global",
    show_variable_as_property = true,
  },
})
