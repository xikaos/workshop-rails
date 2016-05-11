require 'test_helper'

class LoginTest < ActionDispatch::IntegrationTest
  test "with valid credentials" do
    user = FactoryGirl.create(:user)

    visit "/"
    click_on "Log in"

    fill_in "Your email", with: user.email
    fill_in "Your password", with: "test"
    click_on "Access your account"

    assert_equal "/tasks", page.current_path
  end

  test "with invalid credentials" do 
    user = FactoryGirl.create(:user)

    visit "/"
    click_on "Log in"
    fill_in "Your email", with: user.email
    fill_in "Your password", with: "jest"
    click_on "Access your account"

    assert_equal "/login", page.current_path
    assert page.has_text?("Invalid e-mail or password.")
  end
end
