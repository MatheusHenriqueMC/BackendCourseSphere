class ChatController < ApplicationController
  def create
    course = Course.find(params[:course_id])
    lessons = course.lessons

    message = params[:message]

    if message.blank?
      render json: { error: 'Message is required' }, status: :unprocessable_entity
      return
    end

    response = AiChatService.chat(course, lessons, message)

    render json: { response: response }, status: :ok
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'Course not found' }, status: :not_found
  end
end