require "test_helper"

class AuthControllerTest < ActionDispatch::IntegrationTest
  test "register creates user" do
    post "/register", params: { name: "Test", email: "new@test.com", password: "123456" }
    assert_response :created
    json = JSON.parse(response.body)
    assert json["token"].present?
  end

  test "register fails with invalid data" do
    post "/register", params: { name: "", email: "", password: "" }
    assert_response :unprocessable_entity
  end

  test "login returns token" do
    User.create!(name: "Test", email: "login@test.com", password: "123456")
    post "/login", params: { email: "login@test.com", password: "123456" }
    assert_response :ok
    json = JSON.parse(response.body)
    assert json["token"].present?
  end

  test "login fails with wrong credentials" do
    post "/login", params: { email: "wrong@test.com", password: "wrong" }
    assert_response :unauthorized
  end
end