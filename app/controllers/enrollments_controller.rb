class EnrollmentsController < ApplicationController
  def create
    course = Course.find(params[:course_id])
    enrollment = current_user.enrollments.build(course: course)

    if enrollment.save
      render json: { message: 'Enrolled successfully', enrollment_count: course.enrollments.count }, status: :created
    else
      render json: { errors: enrollment.errors.full_messages }, status: :unprocessable_entity
    end
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'Course not found' }, status: :not_found
  end

  def destroy
    course = Course.find(params[:course_id])
    enrollment = current_user.enrollments.find_by(course: course)

    if enrollment
      enrollment.destroy
      render json: { message: 'Unenrolled successfully', enrollment_count: course.enrollments.count }, status: :ok
    else
      render json: { error: 'Not enrolled in this course' }, status: :not_found
    end
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'Course not found' }, status: :not_found
  end
end