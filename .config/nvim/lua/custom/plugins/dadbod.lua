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

    vim.env.MYSQL_PWD = 'password01'

    vim.g.dbs = {
      { name = 'classicmodels', url = 'mysql://user01@localhost:3306/classicmodels' },
      { name = 'large_database', url = 'mysql://user01@localhost:3306/large_database' },
      { name = 'large_database_1', url = 'mysql://user01@localhost:3306/large_database_1' },
      { name = 'library', url = 'mysql://user01@localhost:3306/library' },
      { name = 'sakila', url = 'mysql://user01@localhost:3306/sakila' },
    }
  end,
}
