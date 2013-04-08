module LoginHelper
  def login_to_system(user)
    visit root_path
    click_link('Login')
    fill_in('Email', :with => user.email)
    fill_in('Password', :with => user.password)
    click_button('Start Flirting')
  end
end
