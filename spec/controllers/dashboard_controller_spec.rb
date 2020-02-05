require "rails_helper"

RSpec.describe DashboardController, type: :controller do
  describe 'GET index' do
    let(:user) { FactoryBot.create :user, password: 'Abc@1234', password_confirmation: 'Abc@1234', accept_terms: '1' }
    subject(:dashboard_page) { get :index }

    it 'render index page' do
      allow(controller).to receive(:current_user).and_return(user)
      expect(dashboard_page).to render_template('index')
    end
  end
end