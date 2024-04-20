class User < ApplicationRecord
  include HasSecureTokens

  has_secure_password

  validates_presence_of :email
  validates_presence_of :name
  validates_uniqueness_of :email, case_sensitive: false

  has_many :video_sharings

  def self.find_in_cache(id)
    Rails.cache.fetch(['User', id], expires_in: 5.minutes) do
      find_by(id: id)
    end
  end
end
