require "rails_helper"

RSpec.describe UsersController, type: :controller do
  describe '.new' do
    subject(:signup_page) { get :new }

    it { expect(signup_page).to render_template('new') }
  end
end