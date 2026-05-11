require "test_helper"

class CoursesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = User.create!(name: "Test", email: "test#{rand(9999)}@test.com", password: "123456")
    @token = JwtService.encode(user_id: @user.id)
    @headers = { "Authorization" => "Bearer #{@token}" }
  end

  test "list courses" do
    Course.create!(name: "Ruby", start_date: Date.today, end_date: Date.today + 30, creator: @user)
    get "/courses", headers: @headers
    assert_response :ok
  end

  test "unauthorized without token" do
    get "/courses"
    assert_response :unauthorized
  end

  test "create course" do
    post "/courses", params: { name: "New Course", start_date: Date.today, end_date: Date.today + 30 }, headers: @headers
    assert_response :created
  end

  test "update own course" do
    course = Course.create!(name: "Ruby", start_date: Date.today, end_date: Date.today + 30, creator: @user)
    put "/courses/#{course.id}", params: { name: "Updated" }, headers: @headers
    assert_response :ok
  end

  test "cannot update others course" do
    other = User.create!(name: "Other", email: "other#{rand(9999)}@test.com", password: "123456")
    course = Course.create!(name: "Ruby", start_date: Date.today, end_date: Date.today + 30, creator: other)
    put "/courses/#{course.id}", params: { name: "Hacked" }, headers: @headers
    assert_response :forbidden
  end

  test "delete own course" do
    course = Course.create!(name: "Ruby", start_date: Date.today, end_date: Date.today + 30, creator: @user)
    delete "/courses/#{course.id}", headers: @headers
    assert_response :ok
  end
end