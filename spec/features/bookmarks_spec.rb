feature 'shows Bookmarks page' do

  scenario 'it visits /' do
    visit '/'
    expect(page).to have_content('homepage')
  end

  scenario 'it visits /bookmarks' do
    visit '/bookmarks'
    expect(page).to have_content('Bookmarks')
  end

  scenario 'shows bookmarks' do
    visit '/bookmarks'
    expect(page).to have_content('http://www.makersacademy.com')
    expect(page).to have_content("http://www.google.com")
    expect(page).to have_content("http://www.destroyallsoftware.com")
  end

end
