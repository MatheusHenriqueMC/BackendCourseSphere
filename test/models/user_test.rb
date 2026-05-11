require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "valid user" do
    user = User.new(name: "Test", email: "test@test.com", password: "123456")
    assert user.valid?
  end

  test "invalid without name" do
    user = User.new(email: "test@test.com", password: "123456")
    assert_not user.valid?
  end

  test "invalid without email" do
    user = User.new(name: "Test", password: "123456")
    assert_not user.valid?
  end

  test "invalid with duplicate email" do
    User.create!(name: "Test", email: "dup@test.com", password: "123456")
    user = User.new(name: "Test2", email: "dup@test.com", password: "123456")
    assert_not user.valid?
  end

  test "invalid with short password" do
    user = User.new(name: "Test", email: "test@test.com", password: "123")
    assert_not user.valid?
  end
end