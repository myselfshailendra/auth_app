class User < ApplicationRecord
  PASSWORD_LENGTH = 8..16
  PASSWORD_FORMAT = /\A
  (?=.{8,})          # Must contain 8 or more characters
  (?=.*\d)           # Must contain a digit
  (?=.*[a-z])        # Must contain a lower case character
  (?=.*[A-Z])        # Must contain an upper case character
  (?=.*[[:^alnum:]]) # Must contain a symbol
/x
  attr_accessor :password, :password_confirmation, :accept_terms
  validates :email, presence: true, format: { with: /\A[^@\s]+@([^@.\s]+\.)+[^@.\s]+\z/ }
  validates :password,
            presence: true,
            length: { in: PASSWORD_LENGTH },
            format: { with: PASSWORD_FORMAT },
            confirmation: true,
            on: :create

  validates_confirmation_of :password
  validates :accept_terms, inclusion: { in: ["1"], message: I18n.t('activerecord.errors.models.user.attributes.accept_terms') }
  before_save :encrypt_password

  def encrypt_password
    self.password_digest = PasswordEncryptionService.new(self).perform
  end

  def authenticate_user(password)
    password && password_digest.eql?(PasswordEncryptionService.new.encrypt(password)) ? true : false
  end
end
