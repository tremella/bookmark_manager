require 'pg'

class Bookmark

  def self.all
    # set up a connection object to the database
    connection = PG.connect(dbname: 'bookmark_manager')
    # make a results object from a 'select all from table' command
    result = connection.exec("SELECT * FROM bookmarks;")
    #map the contents to an array.
    result.map { |bookmark| bookmark['url'] }
    # looks like [{"url"=>"http://www.makersacademy.com"}, ...]
  end


end
