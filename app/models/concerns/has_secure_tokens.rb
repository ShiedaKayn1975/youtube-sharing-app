# frozen_string_literal: true

module HasSecureTokens
  extend ActiveSupport::Concern

  def generate_token(expired_at: 1.months.from_now)
    token = JsonWebToken.new.encode({
      iat: Time.now.to_i,
      exp: expired_at.to_i,
      sub: id,
      name: self.name,
      email: self.email
    })

    token
  end
end
