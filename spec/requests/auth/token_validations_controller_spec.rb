# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'TokenValidations', type: :request do
  describe 'GET #create' do
    subject { get '/api/auth/validate_token', params: {}, headers: user.create_new_auth_token }

    let(:user) { create :user }

    include_examples 'success'

    it 'returns correct data' do
      subject
      expect(json_body[:data][:id]).to eq user.id
    end
  end
end
