module LoginHelper
  def create_user(username, password)
    User.create(username: username, password: password)
  end

  def login(username, password)
    visit '/login'
    fill_in 'username', with: username
    fill_in 'password', with: password
    click_button 'login'
  end

  def create_user_and_login(username, password)
    create_user(username, password)
    login(username, password)
  end

  def do_not_follow_redirect
    options = page.driver.instance_variable_get(:@options)
    prev_value = options[:follow_redirects]
    options[:follow_redirects] = false
    yield
  ensure
    options[:follow_redirects] = prev_value
  end
end

RSpec.configure do |config|
  config.include LoginHelper, type: :feature
end
