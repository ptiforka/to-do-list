# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Session', type: :request do
  let!(:user) { create :user, username: 'username', password: 'password', email: 'email@example.com' }

  describe 'POST #create' do
    subject { post '/api/auth/sign_in', params: params }

    let(:params) { { login: 'email@example.com', password: 'password' } }

    include_examples 'success'

    it 'sets header' do
      subject
      expect(response.header['access-token']).to be_present
    end

    it 'validate resource types' do
      subject
      expect_json_types('data', id: :int, username: :string, email: :string, uid: :string, provider: :string)
    end

    context 'when user try sign in by username' do
      let(:params) { { login: 'username', password: 'password' } }

      include_examples 'success'
    end

    context 'return errors' do
      let(:params) { { login: 'email1@example.com', password: 'password' } }

      include_examples 'validate errors', nil, ['Invalid login credentials. Please try again.']
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys session' do
      delete '/api/auth/sign_out', headers: user.create_new_auth_token
      expect(response.header['access-token']).to eq nil
    end
  end
end
