
feature 'Removing bookmarks on the Bookmarks page' do

  scenario 'user can add, then remove a bookmark' do
    #first must add
    Bookmark.create(url: 'https://asoftmurmur.com/',title: 'A soft murmur' )
    visit 'bookmarks'
    expect(page).to have_link('A soft murmur', href: 'https://asoftmurmur.com/' )
    first('.bookmark').click_button('delete')
    # deletes first element of class Bookmark
    expect(current_path).to eq '/bookmarks'
    expect(page).not_to have_link('A soft murmur', href: 'https://asoftmurmur.com/' )
  end
end
