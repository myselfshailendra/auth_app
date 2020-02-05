require "rails_helper"

RSpec.describe UsersController, type: :controller do
  describe 'GET new' do
    subject(:signup_page) { get :new }

    it { expect(signup_page).to render_template('new') }
  end

  describe 'POST create' do
    let(:assigns_user) { assigns[:user] }
    let(:user_errors) { assigns_user.errors.full_messages }
    before { post :create, params: {user: {email: email, password: password, password_confirmation: password_confirmation, accept_terms: accept_terms}}, xhr: true }

    context 'when submit form with blank fields' do
      let(:email) { '' }
      let(:password) { '' }
      let(:password_confirmation) { '' }
      let(:accept_terms) { '' }

      it { expect(user_errors).to eq(["Email Email address can't be blank",
                                                            "Email Email address is invalid",
                                                            "Password Password can't be blank",
                                                            "Password Password is too short (minimum is 8 characters)",
                                                            "Password Password is invalid",
                                                            "Accept terms Please accept terms"]) }
    end

    context 'when submit form with wrong email format' do
      let(:email) { '@demo@mailinator.com' }
      let(:password) { 'Abc@1234' }
      let(:password_confirmation) { 'Abc@1234' }
      let(:accept_terms) { '1' }

      it { expect(user_errors).to eq(["Email Email address is invalid"])}
      it { expect(assigns_user).to render_template('create')}
    end

    context 'when submit form with less password length' do
      let(:email) { 'demo@mailinator.com' }
      let(:password) { 'Abc@1' }
      let(:password_confirmation) { 'Abc@1' }
      let(:accept_terms) { '1' }

      it { expect(user_errors).to eq(["Password Password is too short (minimum is 8 characters)", "Password Password is invalid"])}
      it { expect(assigns_user).to render_template('create')}
    end

    context 'when submit form with wrong invalid password' do
      let(:email) { 'demo@mailinator.com' }
      let(:password) { 'abcd1234' }
      let(:password_confirmation) { 'abcd1234' }
      let(:accept_terms) { '1' }

      it { expect(user_errors).to eq(["Password Password is invalid"])}
      it { expect(assigns_user).to render_template('create')}
    end

    context 'when submit form with wrong mismatched password' do
      let(:email) { 'demo@mailinator.com' }
      let(:password) { 'Abc@1234' }
      let(:password_confirmation) { 'Xyz@1234' }
      let(:accept_terms) { '1' }

      it { expect(user_errors).to eq(["Password confirmation doesn't match Password", "Password confirmation doesn't match Password"])}
      it { expect(assigns_user).to render_template('create')}
    end

    context 'when submit form with correct details without accepting term' do
      let(:email) { 'demo@mailinator.com' }
      let(:password) { 'Abc@1234' }
      let(:password_confirmation) { 'Abc@1234' }
      let(:accept_terms) { '' }

      it { expect(user_errors).to eq(["Accept terms Please accept terms"])}
      it { expect(assigns_user).to render_template('create')}
    end

    context 'when submit form with correct details with accepting term' do
      let(:email) { 'demo@mailinator.com' }
      let(:password) { 'Abc@1234' }
      let(:password_confirmation) { 'Abc@1234' }
      let(:accept_terms) { '1' }

      it { expect(user_errors).to eq([])}
      it { expect(assigns_user).to redirect_to('/sign_in')}
    end
  end
end