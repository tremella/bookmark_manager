require 'pg'

feature 'Bookmarks page' do

  scenario 'user can visit /bookmarks' do
    visit '/bookmarks'
    expect(page).to have_content('Bookmarks')
  end

  scenario 'shows bookmarks' do
    connection = PG.connect(dbname: 'bookmark_manager_test')

    connection.exec("INSERT INTO bookmarks(id, url, title) VALUES('1','http://www.makersacademy.com', 'Makers');")
    connection.exec("INSERT INTO bookmarks(id, url, title) VALUES('3','http://www.destroyallsoftware.com','Destroy!');")

    visit '/bookmarks'

    expect(page).to have_content("Makers")
    expect(page).to have_content("Destroy")
  end

end
