# frozen_string_literal: true

require 'rails_helper'

RSpec.describe DeviseTokenAuth::TokenValidationsController, type: :routing do
  describe 'routing' do
    let(:path) { '/api/auth/validate_token' }

    it 'routes to #validate_token' do
      expect(get: path).to route_to controller: 'devise_token_auth/token_validations', action: 'validate_token'
    end
  end
end
