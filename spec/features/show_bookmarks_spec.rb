require 'pg'

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
    connection = PG.connect(dbname: 'bookmark_manager_test')

    connection.exec("INSERT INTO bookmarks(url, title) VALUES('http://www.makersacademy.com', 'Makers');")
    connection.exec("INSERT INTO bookmarks(url, title) VALUES('http://www.google.com','Google');")
    connection.exec("INSERT INTO bookmarks(url, title) VALUES('http://www.destroyallsoftware.com','Destroy!');")

    visit '/bookmarks'

    expect(page).to have_content("Makers")
    expect(page).to have_content("Google")
    expect(page).to have_content("Destroy")
  end

end
