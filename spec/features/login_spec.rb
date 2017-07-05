require 'rails_helper'

feature 'login', type: :feature do

  context 'Without a service param' do
    scenario 'without cookie passing correct credentials' do
      visit '/login'

      expect(page).to have_content 'Login'

      fill_in('username', with: 'testuser')
      fill_in('password', with: '123456')
      click_button('login')

      expect(page).to have_content 'Logged in successfully!'
    end
    scenario 'without cookie passing wrong credentials'
  end

  context 'With a service param' do
    scenario 'when logged off passing correct credentials'
    scenario 'when logged off passing wrong credentials'
  end

  context 'when already logged' do
    scenario 'redirects user to a home page'
  end

end
