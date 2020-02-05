require 'rails_helper'

RSpec.describe 'DashboardRoutes', type: :routing do
  describe 'GET #index' do
    it { expect(get: '/dashboard').to route_to(controller: 'dashboard',
                                              action: 'index') }
  end
end