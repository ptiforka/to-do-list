# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validates' do
    let!(:user) { create :user }

    it { is_expected.to validate_presence_of(:username) }
    it { is_expected.to validate_presence_of(:password) }

    it { is_expected.to validate_uniqueness_of(:username) }

    it { is_expected.to validate_length_of(:username).is_at_least(3).is_at_most(50) }
  end
end
