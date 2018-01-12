require 'test_helper'

class UserTest < ActiveSupport::TestCase

  test "email must be present" do
    user = build(:user, email: '')
    user2 = build(:user, email: nil)
    user3 = build(:user, email: 'asdflasfj')
    refute user.valid?
    refute user2.valid?
    assert user3.valid?
  end

  test "email must be at least 4 digits" do
    
  end

  test "email must be unique" do
    user = create(:user, email: "bettymaker@gmail.com")
    user2 = build(:user, email: "bettymaker@gmail.com")
    user3 = build(:user, email: "heytherebuddy@gggmailer.co")
    refute user2.valid?
    assert user3.valid?
  end

  test "name must be present" do
    user = build(:user, name: nil)
    user2 = build(:user, name: '')
    user3 = build(:user, name: '444')
    refute user.valid?
    refute user2.valid?
    assert user3.valid?
  end



  test "user must include password_digest on create" do
    user = build(:user, password_digest: nil)
    refute user.valid?
  end

  test "password_digest must be at least 4 characters long" do
    user = build(:user, password_digest: "123")
    refute user.valid?
  end





end
