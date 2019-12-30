class V1::SessionsController < ApplicationController
  def show
    current_user ? head(:ok) : head(:unauthorized)
  end

  def create
    @user = User.find_by(email: params[:email])

    if @user&.valid_password?(params[:password])
      jwt_token = JWT.encode(
        { user_id: @user.id, exp: (Time.now + 2.weeks).to_i },
        Rails.application.secrets.secret_key_base,
        'HS256'
      )

      render :create, locals: { token: jwt_token }, status: :created
    else
      head(:unauthorized)
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
