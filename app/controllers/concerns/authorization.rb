# frozen_string_literal: true

module Authorization
  extend ActiveSupport::Concern

  def authenticate_user!
    if has_authorization?
      if jwt_claims && jwt_claims['sub'] && (user = User.find_in_cache(jwt_claims['sub']))
        @current_user = user
      else
        render_error 'Invalid credentials', :unauthorized
      end
    else
      render_error 'No authorization credentials received'
    end
  end

  private

  def authorization_headers
    request.headers['Authorization']
  end

  def token
    authorization_headers.split(' ').second
  end

  def has_authorization?
    authorization_headers.present? &&
      authorization_headers.split(' ').size == 2 &&
      authorization_headers.split(' ').first == 'Bearer'
    end

  def jwt_claims
    JsonWebToken.new.decode(token)
  rescue JWT::ExpiredSignature
    nil
  rescue JWT::InvalidIatError
    nil
  rescue JWT::InvalidSubError
    nil
  rescue StandardError
    nil
  end
end
