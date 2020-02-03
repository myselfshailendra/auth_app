class User < ApplicationRecord
  attr_accessor :password, :password_confirmation
  validates :email, presence: true, format: { with: /\A[^@\s]+@([^@.\s]+\.)+[^@.\s]+\z/ }
  validates :password, presence: true, on: :create
  validates_confirmation_of :password
  before_save :encrypt_password

  def encrypt_password
    self.password_digest = PasswordEncryptionService.new(self).perform
  end
end
