class PasswordEncryptionService
  attr_accessor :user

  def initialize(user)
    @user = user
  end

  def perform
    encrypt_20_times(@user.password)
  end

  private

  def encrypt_20_times(password)
    20.times{ password = password.crypt("$5$round=1000$salt$") }
    password
  end
end