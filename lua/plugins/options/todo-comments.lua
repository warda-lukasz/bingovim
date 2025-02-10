require('todo-comments').setup({
  signs = true,
  keywords = {
    FIX = {
      icon = "🔧",
      color = "error",
      alt = { "FIXME", "BUG", "FIXIT", "ISSUE" },
    },
    TODO = { icon = "📎", color = "info" },
    HACK = { icon = "🤯", color = "warning" },
    WARN = { icon = "✋", color = "warning", alt = { "WARNING", "XXX" } },
    PERF = { icon = "🏎️", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
    NOTE = { icon = "📔", color = "hint", alt = { "INFO" } },
  },
  search = {
    command = "rg",
    args = {
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
    },
  },
})
