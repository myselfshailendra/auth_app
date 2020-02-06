class Authentication < ApplicationRecord
  belongs_to :user
  validates :auth_token, presence: true, uniqueness: true

  before_validation :generate_token

  private

  def generate_token
    self.auth_token = loop do
      random_token = SecureRandom.urlsafe_base64(nil, false)
      break random_token unless Authentication.find_by(auth_token: random_token)
    end
  end
end
