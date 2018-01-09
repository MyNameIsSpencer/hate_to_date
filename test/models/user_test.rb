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

  test "phone must be exactly 10 digits long" do
    user = build(:user, phone: 123)
    user2 = build(:user, phone: 123456789)
    user3 = build(:user)
    user4 = build(:user, phone: 12345678901)
    refute user.valid?
    refute user2.valid?
    assert user3.valid?
    refute user4.valid?
  end

  # test "phone cannot be number string" do
  #   user = build(:user, phone: "0000001234567890" )
  #   assert user.invalid?
  # end

  test "phone must be integer" do
    user2 = build(:user, phone: '111222eee4')
    user3 = build(:user, phone: 'asdfghjkla')
    user4 = build(:user, phone: '##########')
    user5 = build(:user, phone: '%%%%%%%%%%')
    user6 = build(:user, phone: '++++++++++')
    user_true = build(:user, phone: 1234567890)
    refute user2.valid?
    refute user3.valid?
    refute user4.valid?
    refute user5.valid?
    refute user6.valid?
    assert user_true.valid?
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
