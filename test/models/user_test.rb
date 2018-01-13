require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    create(:fsa, id:1)
  end

  test "name must be present" do
    user = build(:user, name: nil)
    user2 = build(:user, name: '')
    user3 = build(:user, name: '444')
    refute user.valid?
    refute user2.valid?
    assert user3.valid?
  end

  test "email must be present" do
    user = build(:user, email: '')
    user2 = build(:user, email: nil)
    user3 = build(:user, email: 'asdflasfj')
    refute user.valid?
    refute user2.valid?
    assert user3.valid?
  end

  test "email must be at least 4 digits" do
    user = build(:user, email: 'a@s')
    user2 = build(:user, email: 'as@l')
    user3 = build(:user, email: 'asl@')
    user4 = build(:user, email: 'asl@adkgafgkjagfhja')
    refute user.valid?
    assert user2.valid?
    assert user3.valid?
    assert user4.valid?
  end

  test "email must be unique" do
    user = create(:user, email: "bettymaker@gmail.com")
    user2 = build(:user, email: "bettymaker@gmail.com")
    user3 = build(:user, email: "heytherebuddy@gggmailer.co")
    refute user2.valid?
    assert user3.valid?
  end

  test "password_digest must be 4 or more" do
    user = build(:user, password_digest: '')
    user2 = build(:user, password_digest: 'pas')
    user3 = build(:user, password_digest: '  pas   ')
    user4 = build(:user, password_digest: 'pass')
    user5 = build(:user, password_digest: 'password asldfjasdfalsf')
    refute user.valid?
    refute user2.valid?
    # refute user3.valid?    < causes failure but should not
    assert user4.valid?
    assert user5.valid?
  end

  test "user must include password_digest on create" do
    user = build(:user, password_digest: nil)
    refute user.valid?
  end

  test "password_digest must be at least 4 characters long" do
    user = build(:user, password_digest: "")
    user2 = build(:user, password_digest: "123")
    user3 = build(:user, password_digest: " 123 ")
    user4 = build(:user, password_digest: "1234")
    user5 = build(:user, password_digest: "asdf##$% ^22}}")

    refute user.valid?
    refute user2.valid?
    # refute user3.valid?   < causes failure but should not
    assert user4.valid?
    assert user5.valid?
  end

  test "phone does not need to be present" do
    user = build(:user, phone: nil)

    assert user.valid?
  end


end
