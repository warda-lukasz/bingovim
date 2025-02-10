local lspconfig = require('lspconfig')
local default_config = require('plugins.options.lsp.default_config')

local function detectVersion(rootDir)
    local composer_file = rootDir .. "/composer.json"
    local f = io.open(composer_file, "r")
    if f then
        local content = f:read("*all")
        f:close()
        local php_constraint = content:match('"php"%s*:%s*"([^"]+)"')
        if php_constraint then
            -- Weź pierwszą konkretną wersję z zakresu (np. z ">=7.4" weźmie "7.4")
            return php_constraint:match("[%d%.]+")
        end
    end

    return "8.3" -- domyślna wersja
end

lspconfig.phpactor.setup(vim.tbl_deep_extend("force", default_config, {
  on_new_config = function(new_config, new_root_dir)
      new_config.settings = new_config.settings or {}
      new_config.settings.phpactor = new_config.settings.phpactor or {}
      new_config.settings.phpactor.php = {
          version = detectVersion(new_root_dir)
      }
  end,
  settings = {
    phpactor = {
      -- Podstawowa konfiguracja phpactora
      language_server_phpstan = {
        enabled = true
      },
      language_server_psalm = {
        enabled = false
      },
      completion = {
        enabled = true
      },
      indexer = {
        enabled = true
      },
      symfony = {
        enabled = true
      },
      phpunit = {
        enabled = true
      },
    }
  }
}))
