require 'rails_helper'

RSpec.describe User, type: :model do
  it { is_expected.to validate_presence_of(:email) }
  it { is_expected.to allow_value("shailendra@mailinator.com").for(:email) }
  it { is_expected.to_not allow_value("shailendra").for(:email) }
  it { is_expected.to validate_presence_of(:password) }
  it { is_expected.to validate_confirmation_of(:password) }

  describe '.encrypt_password' do
    let(:user) { FactoryBot.create :user, password: 'abc123', password_confirmation: 'abc123' }

    it 'call encrypt_password callback method' do
      expect(user).to receive(:encrypt_password)
      user.save
    end
  end
end
