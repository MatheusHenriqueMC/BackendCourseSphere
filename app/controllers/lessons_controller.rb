class LessonsController < ApplicationController
  before_action :set_course
  before_action :set_lesson, only: [:show, :update, :destroy]
  before_action :authorize_course_creator, only: [:create, :update, :destroy]

  def index
    lessons = @course.lessons
    render json: lessons.map { |lesson| lesson_response(lesson) }, status: :ok
  end

  def show
    render json: lesson_response(@lesson), status: :ok
  end

  def create
    lesson = @course.lessons.build(lesson_params)

    if lesson.save
      render json: lesson_response(lesson), status: :created
    else
      render json: { errors: lesson.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    if @lesson.update(lesson_params)
      render json: lesson_response(@lesson), status: :ok
    else
      render json: { errors: @lesson.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @lesson.destroy
    render json: { message: 'Lesson deleted successfully' }, status: :ok
  end

  private

  def set_course
    @course = Course.find(params[:course_id])
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'Course not found' }, status: :not_found
  end

  def set_lesson
    @lesson = @course.lessons.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'Lesson not found' }, status: :not_found
  end

  def authorize_course_creator
    unless @course.creator_id == current_user.id
      render json: { error: 'You are not authorized to perform this action' }, status: :forbidden
    end
  end

  def lesson_params
    params.permit(:title, :status, :video_url, :section_id)
  end

  def lesson_response(lesson)
    {
      id: lesson.id,
      title: lesson.title,
      status: lesson.status,
      video_url: lesson.video_url,
      course_id: lesson.course_id,
      section_id: lesson.section_id,
      created_at: lesson.created_at,
      updated_at: lesson.updated_at
    }
  end
end