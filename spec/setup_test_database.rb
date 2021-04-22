require 'pg'

def setup_test_database
  p 'Setting up test database!'
  connection = PG.connect(dbname: 'bookmark_manager_test')
  connection.exec("TRUNCATE bookmarks;")
  # TRUNCATE will clear the table before testing.
end
