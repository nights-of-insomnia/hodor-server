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
      expect(page.current_path).to eql '/home'
    end
    scenario 'without cookie passing wrong credentials' do
      visit '/login'

      expect(page).to have_content 'Login'

      fill_in('username', with: 'testuser')
      fill_in('password', with: '999999')
      click_button('login')

      expect(page).to have_content 'Sorry! Incorrect credentials.'
    end
  end

  context 'With a service param' do
    scenario 'when logged off passing correct credentials'
    scenario 'when logged off passing wrong credentials'
  end

  context 'when already logged' do
    scenario 'redirects user to the home page' do
      login('testuser', '123456')
      visit '/login'

      expect(page.current_path).to eql '/home'
      expect(page).to have_content 'Already logged in.'
    end
  end

end
