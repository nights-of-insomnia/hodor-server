require 'rails_helper'

feature 'Visiting home', type: :feature do
  scenario 'not logged in redirects me to login' do
    visit '/'
    expect(page.current_path).to eql '/login'
  end

  scenario 'logged in shows me the page successfully' do
    login('testuser', '123456')
    visit '/'
    expect(page).to have_content 'Logged in!'
  end
end
