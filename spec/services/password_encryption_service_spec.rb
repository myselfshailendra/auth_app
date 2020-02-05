require 'rails_helper'

describe PasswordEncryptionService do
  let(:user) { FactoryBot.create :user, password: 'Abcd@123', password_confirmation: 'Abcd@123' }
  let(:password_encryption_service) { PasswordEncryptionService.new(user) }

  describe '.initialize' do
    it { expect(password_encryption_service).to be_an_instance_of(PasswordEncryptionService) }
    it { expect(password_encryption_service.user).to be_an_instance_of(User) }
  end

  describe '#perform' do
    before do
      db_user = FactoryBot.create :user, email: 'test1@mailinator.com', password: 'Abcd@123', password_confirmation: 'Abcd@123'
      PasswordEncryptionService.new(db_user)
      db_user.save
    end

    it { expect(password_encryption_service.perform.length).to eq(57) }
    it { expect(password_encryption_service.perform).to eq(User.last.password_digest) }
  end
end