# frozen_string_literal: true

require 'rails_helper'

RSpec.describe DeviseTokenAuth::RegistrationsController, type: :routing do
  describe 'routing' do
    let(:path) { '/api/auth' }

    it 'routes to #create' do
      expect(post: path).to route_to controller: 'devise_token_auth/registrations', action: 'create'
    end
  end
end
