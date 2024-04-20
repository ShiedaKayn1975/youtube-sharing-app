class Api::V1::SessionsController < ApplicationController
  DISABLED_LOGIN_MESSAGE = 'Your account is disabled, if this is unexpected, please contact system admin'.freeze

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
end
