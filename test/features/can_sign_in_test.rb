require "test_helper"

class CanSignInTest < Capybara::Rails::TestCase

  test "can sign out" do
    # setup
    @user = User.create! email: "bob@example.com", first_name: "Bob", last_name: "Not Happy", password: "12345678"

    # actions
    visit root_path
    click_link "Sign In"
    fill_in "Email", with: @user.email
    fill_in "Password", with: "12345678"
    click_button "Sign In"

    click_link "Sign Out"
    refute_content page, "Hi #{@user.first_name}"

  end

  test "signin in" do
    # setup
    @user = User.create! email: "bob@example.com", first_name: "Bob", last_name: "Not Happy", password: "12345678"

    # actions
    visit root_path
    click_link "Sign In"
    fill_in "Email", with: @user.email
    fill_in "Password", with: "12345678"
    click_button "Sign In"

    # assertions (actually test that behavior matches your expectations)
    assert_content page, "Hi #{@user.first_name}"

  end
end
