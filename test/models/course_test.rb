require "test_helper"

class CourseTest < ActiveSupport::TestCase
  setup do
    @user = User.create!(name: "Creator", email: "creator#{rand(9999)}@test.com", password: "123456")
  end

  test "valid course" do
    course = Course.new(name: "Ruby on Rails", start_date: Date.today, end_date: Date.today + 30, creator: @user)
    assert course.valid?
  end

  test "invalid without name" do
    course = Course.new(start_date: Date.today, end_date: Date.today + 30, creator: @user)
    assert_not course.valid?
  end

  test "invalid with short name" do
    course = Course.new(name: "ab", start_date: Date.today, end_date: Date.today + 30, creator: @user)
    assert_not course.valid?
  end

  test "invalid without start_date" do
    course = Course.new(name: "Ruby", end_date: Date.today + 30, creator: @user)
    assert_not course.valid?
  end

  test "invalid when end_date before start_date" do
    course = Course.new(name: "Ruby", start_date: Date.today, end_date: Date.today - 1, creator: @user)
    assert_not course.valid?
  end

  test "destroys lessons when destroyed" do
    course = Course.create!(name: "Ruby", start_date: Date.today, end_date: Date.today + 30, creator: @user)
    Lesson.create!(title: "Intro", status: "draft", course: course)
    assert_difference "Lesson.count", -1 do
      course.destroy
    end
  end
end