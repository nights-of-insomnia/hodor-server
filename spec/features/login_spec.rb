require 'rails_helper'

feature 'login', type: :feature do
  scenario 'Passing wrong credentials does not login' do
    visit '/login'

    expect(page).to have_content 'Login'

    fill_in('username', with: 'testuser')
    fill_in('password', with: '999999')
    click_button('login')

    cookies = page.driver.request.env['rack.request.cookie_hash']
    expect(cookies['CASTGT']).to eql nil
    expect(page).to have_content 'Sorry! Incorrect credentials.'
  end

  scenario 'when already logged redirects user to the home page' do
    create_user_and_login('testuser', '123456')
    visit '/login'

    expect(page.current_path).to eql '/home'
    expect(page).to have_content 'Already logged in.'
  end

  scenario 'passing correct credentials sets the cookie' do
    create_user('testuser', '123456')
    visit '/login'

    expect(page).to have_content 'Login'

    fill_in('username', with: 'testuser')
    fill_in('password', with: '123456')
    click_button('login')
    cookies = page.driver.request.env['rack.request.cookie_hash']
    expect(cookies['CASTGT']).to_not be_nil
  end

  scenario 'Without a service param passing correct credentials logs in' do
    create_user('testuser', '123456')
    visit '/login'

    expect(page).to have_content 'Login'

    fill_in('username', with: 'testuser')
    fill_in('password', with: '123456')
    click_button('login')

    expect(page).to have_content 'Logged in successfully!'
    expect(page.current_path).to eql '/home'
  end

  scenario 'With a service param redirects to service with the ticket' do
    create_user('testuser', '123456')
    service = 'https://apps.example.com'
    escaped_service = Rack::Utils.escape(service)
    visit '/login?service=' + escaped_service

    fill_in('username', with: 'testuser')
    fill_in('password', with: '123456')
    do_not_follow_redirect do
      click_button('login')
      expect(page.driver.status_code).to eq(302)
      expect(page.driver.browser.last_response['Location'])
        .to include('apps.example.com?ticket=')
    end
  end
end
