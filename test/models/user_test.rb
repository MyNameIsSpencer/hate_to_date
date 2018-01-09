require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "email must be unique" do
    user = create(:user, email: "bettymaker@gmail.com")
    user2 = build(:user, email: "bettymaker@gmail.com")
    refute user2.valid?
  end

  test "user must include password on create" do
    user = build(:user, password_digest: nil)
    refute user.valid?
  end

  test "password must be at least 4 characters long" do
    user = build(:user, password_digest: "123")
    refute user.valid?
  end

end
