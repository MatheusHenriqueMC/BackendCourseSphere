class SectionsController < ApplicationController
  before_action :set_course
  before_action :set_section, only: [:update, :destroy]
  before_action :authorize_course_creator, only: [:create, :update, :destroy]

  def index
    sections = @course.sections.includes(:lessons)
    render json: sections.map { |section| section_response(section) }, status: :ok
  end

  def create
    position = (@course.sections.maximum(:position) || 0) + 1
    section = @course.sections.build(section_params.merge(position: position))

    if section.save
      render json: section_response(section), status: :created
    else
      render json: { errors: section.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    if @section.update(section_params)
      render json: section_response(@section), status: :ok
    else
      render json: { errors: @section.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @section.destroy
    render json: { message: 'Section deleted successfully' }, status: :ok
  end

  private

  def set_course
    @course = Course.find(params[:course_id])
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'Course not found' }, status: :not_found
  end

  def set_section
    @section = @course.sections.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'Section not found' }, status: :not_found
  end

  def authorize_course_creator
    unless @course.creator_id == current_user.id
      render json: { error: 'You are not authorized to perform this action' }, status: :forbidden
    end
  end

  def section_params
    params.permit(:name)
  end

  def section_response(section)
    {
      id: section.id,
      name: section.name,
      position: section.position,
      course_id: section.course_id,
      lessons: section.lessons.map { |lesson| lesson_response(lesson) }
    }
  end

  def lesson_response(lesson)
    {
      id: lesson.id,
      title: lesson.title,
      status: lesson.status,
      video_url: lesson.video_url,
      course_id: lesson.course_id,
      section_id: lesson.section_id
    }
  end
end