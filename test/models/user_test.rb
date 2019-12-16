require 'test_helper'

class UserTest < ActiveSupport::TestCase
  fixtures :users

  test "required user attributes should not be empty" do
    user = User.new
    assert user.invalid?
    assert user.errors[:email].any?
  end

  test "passwords should match" do
    user = User.new
    user.email = "test@example.com"
    user.password = "12345678910"
    user.password_confirmation = "99999999999"
    assert user.invalid?
    assert user.errors[:password_confirmation].any?
  end

  test "user must have a unique email" do
    user = User.new
    user.email = users(:regular).email

    assert user.invalid?
    assert user.errors[:email].any?
  end
end
