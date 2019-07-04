# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Registration', type: :request do
  describe 'POST create' do
    subject { post '/api/auth', params: user_attrs }

    let(:user_attrs) { attributes_for :user }

    include_examples 'success'
    include_examples 'change by count', User, 1

    it 'validate resource types' do
      subject
      expect_json_types('data', id: :int, username: :string, email: :string, uid: :string, provider: :string)
    end

    context 'when username and email is null' do
      let(:user_attrs) { attributes_for :user, username: nil, email: nil }

      include_examples 'validate errors', :full_messages, [
        "Email can't be blank", "Username can't be blank", 'Username is too short (minimum is 3 characters)'
      ]
    end
  end
end
