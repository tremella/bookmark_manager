require 'bookmark'

describe Bookmark do
  it 'has .all class method' do
    # this is how we talk about it re: CLASS INSTANCE
    bookmarks = Bookmark.all
    expect(bookmarks).to include("http://www.makersacademy.com",)
    expect(bookmarks).to include("http://www.destroyallsoftware.com",)
    expect(bookmarks).to include("http://www.google.com",)
  end


  # it 'has :list_all class method' do
  #   # this is how we talk about it re: CLASS INSTANCE
  #   expect(described_class).to respond_to(:abc)
  # end


end
