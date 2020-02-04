require 'rails_helper'

RSpec.describe 'UsersRoutes', type: :routing do
  describe 'GET #new' do
    it { expect(get: '/sign_up').to route_to(controller: 'users',
                                              action: 'new') }
  end

  describe 'POST #create' do
    it { expect(post: '/users').to route_to(controller: 'users',
                                              action: 'create') }
  end
end