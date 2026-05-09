class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :update, :destroy]
  before_action :authorize_creator, only: [:update, :destroy]

  def index
    courses = Course.all

    if params[:search].present?
      courses = courses.where('name ILIKE ?', "%#{params[:search]}%")
    end

    render json: courses.map { |course| course_response(course) }, status: :ok
  end

  def show
    render json: course_response(@course), status: :ok
  end

  def create
    course = current_user.courses.build(course_params)

    if course.save
      render json: course_response(course), status: :created
    else
      render json: { errors: course.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    if @course.update(course_params)
      render json: course_response(@course), status: :ok
    else
      render json: { errors: @course.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @course.destroy
    render json: { message: 'Course deleted successfully' }, status: :ok
  end

  private

  def set_course
    @course = Course.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'Course not found' }, status: :not_found
  end

  def authorize_creator
    unless @course.creator_id == current_user.id
      render json: { error: 'You are not authorized to perform this action' }, status: :forbidden
    end
  end

  def course_params
    params.permit(:name, :description, :start_date, :end_date, :image_url, :level)
  end

  def course_response(course)
    {
      id: course.id,
      name: course.name,
      description: course.description,
      start_date: course.start_date,
      end_date: course.end_date,
      image_url: course.image_url,
      level: course.level,
      creator_id: course.creator_id,
      created_at: course.created_at,
      updated_at: course.updated_at
    }
  end
end