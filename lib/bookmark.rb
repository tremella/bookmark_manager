require 'pg'
require_relative 'database_connection'

class Bookmark
  def self.all
    result = DatabaseConnection.query("SELECT * FROM bookmarks")
    result.map do |bookmark|
      Bookmark.new(url: bookmark['url'],
        title: bookmark['title'],
        id: bookmark['id']
      )
      end
  end

  # def self.all
  #   if ENV['ENVIRONMENT'] == 'test'
  #     connection = PG.connect(dbname: 'bookmark_manager_test')
  #   else
  #     connection = PG.connect(dbname: 'bookmark_manager')
  #   end
  #   # make a results object from a 'select all from table' command
  #   result = connection.exec("SELECT * FROM bookmarks;")
  #   #map the contents to an array.
  #   result.map do |bookmark|
  #     # bookmark
  #     Bookmark.new(id: bookmark['id'], title: bookmark['title'], url: bookmark['url'])
  #   end
  #   # looks like [{"url"=>"http://www.makersacademy.com"}, ...]
  # end

  def self.create(url:, title:)
    # if ENV['ENVIRONMENT'] == 'test'
    #   connection = PG.connect(dbname: 'bookmark_manager_test')
    # else
    #   connection = PG.connect(dbname: 'bookmark_manager')
    # end
    # result = connection.exec("INSERT INTO bookmarks (url, title) VALUES('#{url}', '#{title}') RETURNING id, title, url;") ###
    result = DatabaseConnection.query("INSERT INTO bookmarks (url, title) VALUES('#{url}', '#{title}') RETURNING id, title, url;")
    Bookmark.new(id: result[0]['id'], title: result[0]['title'], url: result[0]['url'])
  end

  def self.delete(id:)
    DatabaseConnection.query("DELETE FROM bookmarks WHERE id = #{id}")
    # if ENV['ENVIRONMENT'] == 'test'
    #   connection = PG.connect(dbname: 'bookmark_manager_test')
    # else
    #   connection = PG.connect(dbname: 'bookmark_manager')
    # end
    # connection.exec("DELETE FROM bookmarks WHERE id = #{id}")
  end

  def self.update(id:, url:, title:)
    result = DatabaseConnection.query("UPDATE bookmarks SET url = '#{url}', title = '#{title}' WHERE id = #{id} RETURNING id, url, title;")
    Bookmark.new(id: result[0]['id'], title: result[0]['title'], url: result[0]['url'] )
    # if ENV['ENVIRONMENT'] == 'test'
    #   connection = PG.connect(dbname: 'bookmark_manager_test')
    # else
    #   connection = PG.connect(dbname: 'bookmark_manager')
    # end
    # result = connection.exec("UPDATE bookmarks SET title = '#{title}', url = '#{url}' WHERE id = #{id} RETURNING id, url, title;")
  end

  def self.find(id:)
      result = DatabaseConnection.query("SELECT * FROM bookmarks WHERE id = #{id}")
      Bookmark.new(id: result[0]['id'], title: result[0]['title'], url: result[0]['url'])
    end

  #suggested additions::
  attr_reader :id, :url, :title
  #
  def initialize(id:, title:, url:)
    @id = id
    @url = url
    @title = title
  end

end
