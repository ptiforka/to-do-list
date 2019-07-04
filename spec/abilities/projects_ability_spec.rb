# frozen_string_literal: true

require 'rails_helper'

describe Project do
  subject(:ability) { Ability.new(user) }

  let(:user) { nil }

  context 'when user interacts with his project' do
    let(:user) { create :user }
    let(:project) { create :project, user: user }

    it { is_expected.to be_able_to(:index, project) }
    it { is_expected.to be_able_to(:create, project) }
    it { is_expected.to be_able_to(:update, project) }
    it { is_expected.to be_able_to(:destroy, project) }
  end

  context 'when user try interacts with projects from another user' do
    let(:user) { create :user }
    let(:project) { create :project }

    it { is_expected.not_to be_able_to(:index, project) }
    it { is_expected.not_to be_able_to(:create, project) }
    it { is_expected.not_to be_able_to(:update, project) }
    it { is_expected.not_to be_able_to(:destroy, project) }
  end
end
