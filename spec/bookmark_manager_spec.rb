require 'bookmark_manager.rb'

describe BookmarkManager do
  it 'has :list_all class method' do
    # this is how we talk about it re: CLASS INSTANCE
    expect(described_class).to respond_to(:list_all)
  end

  # it 'has :list_all class method' do
  #   # this is how we talk about it re: CLASS INSTANCE
  #   expect(described_class).to respond_to(:abc)
  # end


end
