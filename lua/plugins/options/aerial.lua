require('aerial').setup({
  layout = {
    default_direction = "right",
    width = 30
  },
  filter_kind = {
    "Class",
    "Constructor",
    "Function",
    "Method",
    "Property",
    -- Add these for PHP and TypeScript/React support
    "Variable", -- For PHP properties
    "Interface",
    "Constant",
    "Component", -- For React components
  },

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
