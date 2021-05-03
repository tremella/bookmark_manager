require 'bookmark'

describe Bookmark do
  it 'has .all class method' do
    # this is how we talk about it re: CLASS INSTANCE
    connection = PG.connect(dbname: 'bookmark_manager_test')
    connection.exec("INSERT INTO bookmarks (url, title) VALUES ('http://www.makersacademy.com','Makers');")
    connection.exec("INSERT INTO bookmarks (url, title) VALUES ('http://www.destroyallsoftware.com','Destroy');")
    bookmarks = Bookmark.all
    expect(bookmarks.to_s).to include("http://www.makersacademy.com")
    expect(bookmarks.to_s).to include("http://www.destroyallsoftware.com")
  end

describe '.create' do
  it 'creates a new bookmark' do
    Bookmark.create(url: "http://www.makersacademy.com", title: 'makers')
    expect(Bookmark.all.to_s).to include "http://www.makersacademy.com"
    expect(Bookmark.all.to_s).to include 'makers'
  end
end

describe '.delete' do
  it 'deletes a given bookmark' do
    Bookmark.create(url: "http://www.makersacademy.com", title: 'makers')
    bookmarks = Bookmark.all
    Bookmark.delete(id: bookmarks.first.id)
    expect(Bookmark.all.length).to eq 0
  end
end

describe '.edit' do
  it 'updates the bookmark with the new info' do
    bookmark = Bookmark.create(url: "http://www.makersacademy.com", title: 'makers')
    updated_bookmark = Bookmark.update(id: bookmark.id, url:'http://www.destroyallsoftware.com',title:'Destroy')
    expect(updated_bookmark).to be_a Bookmark
    expect(Bookmark.all.first.title).to include('Destroy')
    expect(Bookmark.all.first.title).not_to include('makers')
  end
end

end
