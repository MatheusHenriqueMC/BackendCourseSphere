class AuthController < ApplicationController
  skip_before_action :authorize_request, only: [:register, :login]

  def register
    user = User.new(register_params)

    if user.save
      token = JwtService.encode(user_id: user.id)
      render json: {
        user: user_response(user),
        token: token
      }, status: :created
    else
      render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def login
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      token = JwtService.encode(user_id: user.id)
      render json: {
        user: user_response(user),
        token: token
      }, status: :ok
    else
      render json: { error: 'Invalid email or password' }, status: :unauthorized
    end
  end

  private

  def register_params
    params.permit(:name, :email, :password)
  end

  def user_response(user)
    {
      id: user.id,
      name: user.name,
      email: user.email
    }
  end
end