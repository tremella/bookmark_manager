require 'bookmark'

describe Bookmark do
  it 'has .all class method' do
    # this is how we talk about it re: CLASS INSTANCE
    connection = PG.connect(dbname: 'bookmark_manager_test')
    # connection.exec("INSERT INTO bookmarks (url, title) VALUES ('http://www.makersacademy.com','Makers');")
    # connection.exec("INSERT INTO bookmarks (url, title) VALUES ('http://www.destroyallsoftware.com','Destroy');")
    # connection.exec("INSERT INTO bookmarks (url, title) VALUES ('http://www.google.com','Google');")

    bookmarks = Bookmark.all
    # expect(bookmarks.to_s).to include("http://www.makersacademy.com")
    # expect(bookmarks.to_s).to include("http://www.destroyallsoftware.com")
    # expect(bookmarks.to_s).to include("http://www.google.com")
  end

describe '.create' do
  it 'creates a new bookmark' do
    Bookmark.create(url: 'http://www.testbookmark.com', title: 'test bookmark')
    expect(Bookmark.all.to_s).to include 'http://www.testbookmark.com'
    expect(Bookmark.all.to_s).to include 'test bookmark'
  end
end

describe '.delete' do
  it 'deletes a given bookmark' do
    Bookmark.create(url: 'https://asoftmurmur.com/', title: 'A Soft Murmur')
    bookmarks = Bookmark.all
    # p Bookmark.all
    Bookmark.delete(id: bookmarks.first.id)
    # p Bookmark.all
    expect(Bookmark.all.length).to eq 0
  end
end

describe '.edit' do
  it 'updates the bookmark with the new info' do
    bookmark = Bookmark.create(url: 'https://asoftmurmur.com/', title: 'A soft murmur' )
    updated_bookmark = Bookmark.update(id: bookmark.id, url:'https://loudscreeching.com/',title:'LOUD SCREECHING')
    expect(updated_bookmark).to be_a Bookmark

  end
end


end
