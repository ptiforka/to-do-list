# frozen_string_literal: true

require 'rails_helper'

RSpec.describe DeviseTokenAuth::SessionsController, type: :routing do
  describe 'routing' do
    let(:path) { '/api/auth' }

    it 'routes to #create' do
      expect(post: "#{path}/sign_in").to route_to controller: 'devise_token_auth/sessions', action: 'create'
    end

    it 'routes to #delete' do
      expect(delete: "#{path}/sign_out").to route_to controller: 'devise_token_auth/sessions', action: 'destroy'
    end
  end
end
