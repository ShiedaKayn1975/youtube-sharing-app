class Api::V1::SessionsController < ApplicationController
  DISABLED_LOGIN_MESSAGE = 'Your account is disabled, if this is unexpected, please contact system admin'.freeze
  before_action :authenticate_user!, only: [:me]

  def create
    if params[:email].blank? || params[:password].blank?
      render_error 'Email and password are required', :bad_request
      return
    end

    user = User.find_by_email(params[:email].to_s.downcase)

    if user&.authenticate(params[:password]) && (token = user.generate_token)
      unless user.active?
        render_error(DISABLED_LOGIN_MESSAGE, :bad_request) 
        return
      end

      render json: { token: token }, status: :ok
    else
      render_error 'Wrong email or password', :unauthorized
    end
  end

  def me
    profile = @current_user.as_json(except: [
      :password_digest
    ])

    return render json: profile, status: :ok
  end
end
