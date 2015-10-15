require "test_helper"

class SignUpTest < Capybara::Rails::TestCase
  test "can sign up" do

    visit root_path
    click_link "Sign Up"
    fill_in "First Name", with: "Jesse"
    fill_in "Last Name", with: "Wolgamott"
    fill_in "Email", with: "jesse@theironyard.com"
    fill_in "Password", with: "12345678"
    fill_in "Sorry, evidently I have to ask again", with: "12345678"

    click_button "Create Account"

    assert_content page, "Welcome to YayTacos, Jesse"

  end
end
