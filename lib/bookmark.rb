require 'pg'

class Bookmark

  def self.all

    if ENV['ENVIRONMENT'] == 'test'
      # this will only connect to the test database when running rspec.
      # meaning it will test on a different table than while in development
      connection = PG.connect(dbname: 'bookmark_manager_test')
    else
    # set up a connection object to the DEVELOPMENT database
      connection = PG.connect(dbname: 'bookmark_manager')
    end

    # make a results object from a 'select all from table' command
    result = connection.exec("SELECT * FROM bookmarks;")
    #map the contents to an array.
    result.map { |bookmark| bookmark }

    # looks like [{"url"=>"http://www.makersacademy.com"}, ...]
  end

  def self.create(url:, title:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'bookmark_manager_test')
    else
      connection = PG.connect(dbname: 'bookmark_manager')
    end
    connection.exec("INSERT INTO bookmarks (url, title) VALUES('#{url}', '#{title}')") ###

  end

  def self.delete(id:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'bookmark_manager_test')
    else
      connection = PG.connect(dbname: 'bookmark_manager')
    end
    connection.exec("DELETE FROM bookmarks WHERE id = #{id}")
  end


  #suggested additions::
  attr_reader :id, :url
  #
  def initialize(id:, url:)
    @id = id
    @url = url
  end

end
