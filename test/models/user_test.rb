require "test_helper"

class UserTest < ActiveSupport::TestCase

  test "requires name" do
    user = User.create(name: "")
    refute user.errors[:name].empty?     
  end

  test "requires email" do
    user = User.create(email: "")
    refute user.errors[:email].empty?     
  end

  %w[
    xikaoswow@gmail.com
    fnando@gmail.com
    cami-shchleder-linda@hotmail.com
    alcindoschleder@gov.rs.br
    jururu@kkkkkk.com
  ].each do |email|
    test "accept valid email format (#{email})" do
      user = User.create(email: email)
      assert user.errors[:email].empty?
    end
  end

  test "rejects duplicate email" do
    user = User.create!(name: "John", email: "john@example.lul", password: "test")
    another_user = User.create(name: "Johnny", email: "john@example.lul", password: "test") 

    refute another_user.errors.empty? 
  end

end