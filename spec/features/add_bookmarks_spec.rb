
feature 'the Add Bookmarks page' do
  scenario 'user can visit /add' do
      visit '/add'
      expect(page).to have_content('add bookmark')
    end

  scenario 'user can submit a new bookmark to the form' do
    visit 'bookmarks/new'
    fill_in :url, with: 'https://asoftmurmur.com/'
    fill_in :title, with: 'A soft murmur'
    click_button 'Submit'
    # expect(page).to have_content('https://asoftmurmur.com/')
    expect(page).to have_content('A soft murmur')
  end
end