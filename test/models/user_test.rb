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
    xsikaoswow@gmail.com
    fsnando@gmail.com
    csami-shchleder-linda@hotmail.com
    aslcindoschleder@gov.rs.br
    jsururu@kkkkkk.com
  ].each do   |email|
    test "accept valid email format (#{email})" do
      user = User.create(email: email)
      assert user.errors[:email].empty?
    end
  end 

  test "rejects duplicate email" do
    user = FactoryGirl.create(:user)
    another_user = User.create(email: user.email)
    refute another_user.errors.empty? 
  end

end