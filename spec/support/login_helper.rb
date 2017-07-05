module LoginHelper

  def login(username, password)
    visit '/login'
    fill_in 'username', with: username
    fill_in 'password', with: password
    click_button 'login'
  end

  def do_not_follow_redirect &block
    begin
      options = page.driver.instance_variable_get(:@options)
      prev_value = options[:follow_redirects]
      options[:follow_redirects] = false
      yield
    ensure
      options[:follow_redirects] = prev_value
    end
  end

end

RSpec.configure do |config|
  config.include LoginHelper, type: :feature
end