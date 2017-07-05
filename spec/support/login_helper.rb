module LoginHelper

  def login(username, password)
    visit '/login'
    fill_in 'username', with: username
    fill_in 'password', with: password
    click_button 'login'
  end

end

RSpec.configure do |config|
  config.include LoginHelper, type: :feature
end