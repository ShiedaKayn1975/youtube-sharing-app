class Api::V1::RegistrationsController < ApplicationController
  def create
    @user = User.new(registration_params)
    if @user.save
      token = @user.generate_token
      render json: {
        account: @user.as_json(except: [
          :id, :password_digest
        ]),
        token: token
      }, status: :ok
    else
      render_error @user.errors.full_messages
    end
  end

  private

  def registration_params
    params.permit(:email, :name, :password, :password_confirmation)
  end
end
