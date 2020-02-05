require 'rails_helper'

RSpec.describe 'SessionsRoutes', type: :routing do
  describe 'GET #new' do
    it { expect(get: '/sign_in').to route_to(controller: 'sessions',
                                              action: 'new') }
  end
end