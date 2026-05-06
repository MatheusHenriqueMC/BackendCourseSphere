module Authenticatable
  extend ActiveSupport::Concern

  private

  def authorize_request
    header = request.headers['Authorization']
    token = header.split(' ').last if header

    decoded = JwtService.decode(token)
    if decoded
      @current_user = User.find_by(id: decoded[:user_id])
    end

    unless @current_user
      render json: { error: 'Unauthorized' }, status: :unauthorized
    end
  end

  def current_user
    @current_user
  end
end