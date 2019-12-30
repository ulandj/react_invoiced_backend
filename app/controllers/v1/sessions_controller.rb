class V1::SessionsController < ApplicationController
  def show
    current_user ? head(:ok) : head(:unauthorized)
  end

  def create
    @user = User.find_by(email: params[:email])

    if @user&.valid_password?(params[:password])
      jwt_token = WebToken.encode(@user)

      render :create, locals: { token: jwt_token }, status: :created
    else
      render json: {error: 'invalid_credentials' }, status: :unauthorized
    end
  end

  def destroy
    current_user&.authentication_token = nil
    if current_user&.save
      head(:ok)
    else
      head(:unauthorized)
    end
  end
end
