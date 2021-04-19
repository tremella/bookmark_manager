feature 'test infrastructue' do
  scenario 'it prints hello world' do
    visit '/'
    expect(page).to have_content('hello, world')
  end
end
