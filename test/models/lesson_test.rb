require "test_helper"

class LessonTest < ActiveSupport::TestCase
  setup do
    user = User.create!(name: "Creator", email: "creator#{rand(9999)}@test.com", password: "123456")
    @course = Course.create!(name: "Ruby", start_date: Date.today, end_date: Date.today + 30, creator: user)
  end

  test "valid lesson" do
    lesson = Lesson.new(title: "Introduction", status: "draft", course: @course)
    assert lesson.valid?
  end

  test "invalid without title" do
    lesson = Lesson.new(status: "draft", course: @course)
    assert_not lesson.valid?
  end

  test "invalid with bad status" do
    lesson = Lesson.new(title: "Intro", status: "invalid", course: @course)
    assert_not lesson.valid?
  end

  test "valid with video_url" do
    lesson = Lesson.new(title: "Intro", status: "published", video_url: "https://youtube.com/watch?v=123", course: @course)
    assert lesson.valid?
  end

  test "invalid with bad video_url" do
    lesson = Lesson.new(title: "Intro", status: "draft", video_url: "not-a-url", course: @course)
    assert_not lesson.valid?
  end
end