feature 'edit bookmarks on the Bookmarks page' do
  #
  scenario 'user can alter an existing bookmark' do
    old_bookmark = Bookmark.create(url: 'https://asoftmurmur.com/',title: 'A soft murmur' )
    visit 'bookmarks'
    # save_and_open_page
    expect(page).to have_link('A soft murmur', href: 'https://asoftmurmur.com/' )
    first('.bookmark').click_button('edit')
    fill_in :url, with: 'https://aloudscreeching.com/'
    fill_in :title, with: 'A LOUD SCREECHING'
    click_button 'Submit'
    # save_and_open_page
    expect(current_path).to eq '/bookmarks'
    expect(page).to have_link('A LOUD SCREECHING', href: 'https://aloudscreeching.com/')
  end

end
