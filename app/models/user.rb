class User < ApplicationRecord
  attr_accessor :password, :password_confirmation
  validates :email, presence: true, format: { with: /\A[^@\s]+@([^@.\s]+\.)+[^@.\s]+\z/ }
  validates :password, presence: true, on: :create
  validates_confirmation_of :password
end
