require 'bookmark'

describe Bookmark do
  it 'has .all class method' do
    # this is how we talk about it re: CLASS INSTANCE
    connection = PG.connect(dbname: 'bookmark_manager_test')

    connection.exec("INSERT INTO bookmarks (url, title) VALUES ('http://www.makersacademy.com','Makers');")
    connection.exec("INSERT INTO bookmarks (url, title) VALUES ('http://www.destroyallsoftware.com','Destroy');")
    connection.exec("INSERT INTO bookmarks (url, title) VALUES ('http://www.google.com','Google');")


    bookmarks = Bookmark.all
    expect(bookmarks.to_s).to include("http://www.makersacademy.com")
    expect(bookmarks.to_s).to include("http://www.destroyallsoftware.com")
    expect(bookmarks.to_s).to include("http://www.google.com")
  end

  # [
  #   {"id" => "220", "title" => "Makers", "url" => "http://www.makersacademy.com"},
  #   {"id" => "221", "title" => "Des...tp://www.destroyallsoftware.com"},
  #   {"id" => "222", "title" => "Google", "url" => "http://www.google.com"}
  # ]

describe '.create' do
  it 'creates a new bookmark' do
    Bookmark.create(url: 'http://www.testbookmark.com', title: 'test bookmark')

    expect(Bookmark.all.to_s).to include 'http://www.testbookmark.com'
    expect(Bookmark.all.to_s).to include 'test bookmark'
  end
end

# def self.create(url:, title:)
#   if ENV['ENVIRONMENT'] == 'test'
#     connection = PG.connect(dbname: 'bookmark_manager_test')
#   else
#     connection = PG.connect(dbname: 'bookmark_manager')
#   end
#   connection.exec("INSERT INTO bookmarks (url) VALUES('#{url}', '#{title}')")
# end

  # it 'has :list_all class method' do
  #   # this is how we talk about it re: CLASS INSTANCE
  #   expect(described_class).to respond_to(:abc)
  # end


end
