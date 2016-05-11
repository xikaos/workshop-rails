require 'test_helper'
require "minitest/utils/rails"


class SignupTest < ActionDispatch::IntegrationTest
  test "with valid data" do 
    visit "/"
    click_link "Sign up"

    fill_in "Your name", with: "Francisco Zanatta"
    fill_in "Your e-mail",with: "franciscozanatta@protonmail.com"
    fill_in "Your password", with: "sai123fui"
    fill_in "Confirm your password", with: "sai123fui"

    click_on "Create my account"

    assert_equal "/login", page.current_path
    assert page.has_text?("Your account has been created.")        
  end

  test "with invalid data" do
    visit "/"
    click_link "Sign up"

    fill_in "Your name", with: "Francisco Zanatta"
    fill_in "Your e-mail",with: "franciscozanatta@protonmail.com"
    fill_in "Your password", with: "sai123fui"
    fill_in "Confirm your password", with: "sai123fuu"

    click_on "Create my account"

    assert_equal "/signup", page.current_path
    assert page.has_text?("Invalid input.")
  end

end
''