require 'rails_helper'

feature 'Visiting home', type: :feature do
  scenario 'not logged in redirects me to login' do
    visit '/'
    expect(page.current_path).to eql '/login'
  end

  scenario 'logged in shows me the page successfully' do
    create_user_and_login('testuser', '123456')
    visit '/'
    expect(page).to have_content 'Logged in!'
  end

  scenario 'logged in with expired cookie redirects me to login' do
    create_user_and_login('testuser', '123456')
    TGTCookie.last.update_attributes(created_at: 30.minutes.ago)
    visit '/'
    expect(page.current_path).to eql '/login'
  end
end
