local lspconfig = require("lspconfig")

local function get_php_version_from_composer()
  -- Spróbuj znaleźć composer.json w katalogu projektu
  local composer_path = vim.fn.getcwd() .. "/composer.json"

  -- Sprawdź czy plik istnieje
  if vim.fn.filereadable(composer_path) == 0 then
    return nil
  end

  -- Wczytaj zawartość pliku
  local content = vim.fn.readfile(composer_path)
  local composer_json = table.concat(content, "\n")

  -- Parsuj JSON
  local ok, decoded = pcall(vim.fn.json_decode, composer_json)
  if not ok then
    return nil
  end

  -- Sprawdź sekcję "require" dla wersji PHP
  if decoded.require and decoded.require.php then
    return decoded.require.php
  end

  return nil
end

local function print_php_version()
  local clients = vim.lsp.get_active_clients({ name = "intelephense" })
  for _, client in ipairs(clients) do
    if client.config.settings.intelephense and client.config.settings.intelephense.environment then
      local version = client.config.settings.intelephense.environment.phpVersion
      print("Ustawiona wersja PHP: " .. (version or "nie określono"))
      return
    end
  end
  print("Nie znaleziono aktywnego klienta Intelephense lub wersja PHP nie jest ustawiona")
end

-- Możesz dodać komendę Vim do wywoływania tej funkcji
vim.api.nvim_create_user_command("PhpVersion", print_php_version, {})


lspconfig.intelephense.setup({
  init_options = {
    licenceKey = vim.env.INTELEPHENSE_LIC_KEY,
  },
  on_init = function(client)
    local php_version = get_php_version_from_composer()
    if php_version then
      -- Ustaw wersję PHP w intelephense jeśli została znaleziona
      client.config.settings.intelephense.environment = {
        phpVersion = php_version:gsub("[^%d%.]", "") -- usuń znaki specjalne (^, ~, etc.)
      }
    end
  end,
  settings = {
    intelephense = {
      files = {
        maxSize = 1000000,
        filesAssociations = {
          "*.php", "*.phtml", "*.html", "*.css", "*.twig", "*.js"
        },
      },
      format = {
        braces = "psr12",
        enable = true,
        indentSize = 4,
        insertFinalNewline = true, -- dodaj tę linię
      },
      stubs = {
        -- PHP core stubs
        "apache", "apcu", "bcmath", "blackfire",
        "bz2", "calendar", "cassandra", "com_dotnet",
        "Core", "couchbase", "crypto", "ctype",
        "cubrid", "curl", "date", "dba", "decimal", "dom",
        "ds", "enchant", "Ev", "event", "exif",
        "fann", "FFI", "ffmpeg", "fileinfo", "filter", "fpm",
        "ftp", "gd", "gearman", "geoip", "geos", "gettext",
        "gmagick", "gmp", "gnupg", "grpc", "hash",
        "http", "ibm_db2", "iconv", "igbinary", "imagick", "imap",
        "inotify", "interbase", "intl", "json",
        "judy", "ldap", "leveldb", "libevent", "libsodium", "libxml",
        "lua", "lzf", "mailparse", "mapscript",
        "mbstring", "mcrypt", "memcache", "memcached", "meminfo",
        "meta", "ming", "mongo", "mongodb", "mosquitto-php",
        "mqseries", "msgpack", "mssql", "mysql", "mysql_xdevapi",
        "mysqli", "ncurses", "newrelic", "oauth", "oci8",
        "odbc", "openssl", "parallel", "Parle", "pcntl", "pcov",
        "pcre", "pdflib", "PDO", "pdo_ibm", "pdo_mysql",
        "pdo_pgsql", "pdo_sqlite", "pgsql", "Phar", "phpdbg",
        "posix", "pspell", "pthreads", "radius", "rar", "rdkafka",
        "readline", "recode", "redis", "Reflection", "regex",
        "rpminfo", "rrd", "SaxonC", "session", "shmop", "SimpleXML",
        "snmp", "soap", "sockets", "sodium", "solr", "SPL",
        "SplType", "SQLite", "sqlite3", "sqlsrv", "ssh2",
        "standard", "stats", "stomp", "suhosin",
        "superglobals", "svn", "sybase", "sync", "sysvmsg",
        "sysvsem", "sysvshm", "tidy", "tokenizer", "uopz",
        "uv", "v8js", "wddx", "win32service", "winbinder",
        "wincache", "wordpress", "xcache", "xdebug",
        "xhprof", "xml", "xmlreader", "xmlrpc",
        "xmlwriter", "xsl", "xxtea", "yaf", "yaml",
        "yar", "zend", "Zend OPcache", "ZendCache",
        "ZendDebugger", "ZendUtils", "zip",
        "zlib", "zmq", "zookeeper", "symfony"
      },
    },
  },
})
