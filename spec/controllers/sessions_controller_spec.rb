require "rails_helper"

RSpec.describe SessionsController, type: :controller do
  describe 'GET new' do
    subject(:signin_page) { get :new }

    it { expect(signin_page).to render_template('new') }
  end

  describe 'POST create' do
    let!(:user) { FactoryBot.create :user, email: 'user@mailinator.com', password: 'Abc@1234', password_confirmation: 'Abc@1234', accept_terms: '1' }
    let(:errors) { assigns[:errors][:password] }
    before { post :create, params: {email: email, password: password, remmeber_me: remember_me}, xhr: true }

    context 'without remember me' do
      context 'when submit form with blank fields' do
        let(:email) { '' }
        let(:password) { '' }
        let(:remember_me) { '' }

        it { expect(errors).to eq(["Invalid credentials!"]) }
      end

      context 'when submit form with wrong email id' do
        let(:email) { 'wrong@mailinator.com' }
        let(:password) { 'Abc@1234' }
        let(:remember_me) { '' }

        it { expect(errors).to eq(["Invalid credentials!"]) }
      end

      context 'when submit form with wrong password' do
        let(:email) { 'user@mailinator.com' }
        let(:password) { 'wrong_password' }
        let(:remember_me) { '' }

        it { expect(errors).to eq(["Invalid credentials!"]) }
      end

      context 'when submit form with correct credentials' do
        let(:email) { 'user@mailinator.com' }
        let(:password) { 'Abc@1234' }
        let(:remember_me) { '' }

        it { expect(session[:user_id]).to eq(user.id) }
      end
    end

    context 'with remember me' do
    end
  end
end