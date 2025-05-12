local function is_sql_workspace()
  return vim.fn.filereadable(".sql_workspace") == 1
end

local function start_mariadb()
  local compose_file = vim.fn.expand("~/.local/share/nvim/mariadb-dev/docker-compose.yaml")

  -- Check if the container is already running
  local status = vim.fn.system("docker inspect -f '{{.State.Running}}' mariadb-dev 2>/dev/null"):gsub("\n", "")

  if status == "true" then
    print("mariadb-dev is already running.")
    return
  end

  -- Run the container
  local result = vim.fn.system({
    "docker", "compose", "-f", compose_file, "up", "-d"
  })

  if vim.v.shell_error == 0 then
    print("MariaDB container started successfully.")
  else
    print("Failed to start MariaDB container:")
    print(result)
  end
end

-- Call with:
-- :lua start_mariadb()

return {
  'kristijanhusak/vim-dadbod-ui',
  dependencies = {
    { 'tpope/vim-dadbod', lazy = true },
    { 'kristijanhusak/vim-dadbod-completion', ft = { 'sql', 'mysql', 'plsql' }, lazy = true }, -- Optional
  },
  cmd = {
    'DBUI',
    'DBUIToggle',
    'DBUIAddConnection',
    'DBUIFindBuffer',
  },
  init = function()
    -- Your DBUI configuration
    vim.g.db_ui_use_nerd_fonts = 1
    start_mariadb()


    vim.g.dbs = {
      mariadb_dev = 'mysql://root:root@172.31.0.2:3306'
    }
    vim.g.db = vim.g.dbs.mariadb_dev

    vim.g.db_ui_auto_execute_table_helpers = 1
    vim.g.db_ui_show_database_icon = 1
    vim.g.db_ui_save_location = '~/.local/share/nvim/db_ui' -- optional: persist workspaces

    -- Inject into cmp *only when this plugin is loaded*
    local cmp = require("cmp")
    cmp.setup.buffer({
      sources = {
        { name = "vim-dadbod-completion" },
        { name = "buffer" },
      },
    })

  end,
  enabled = is_sql_workspace(),
}
