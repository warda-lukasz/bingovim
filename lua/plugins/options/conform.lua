require('conform').setup({
  formatters_by_ft = {
    php = { "php_cs_fixer" },
  },
  formatters = {
    php_cs_fixer = {
      command = "php-cs-fixer",
      args = { "fix", "--no-interaction", "--quiet", "$FILENAME" },
    },
  },
})
