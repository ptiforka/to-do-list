# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ProjectsController, type: :controller do
  describe 'GET #index' do
    subject { get :index, params: params }

    let!(:projects) { create_list :project, 3, user: current_user }
    let(:params) { { page: 1, per_page: 2 } }

    login_user

    include_examples 'success'
    include_examples 'index example', 2
  end

  describe 'POST #create' do
    subject { post :create, params: params }

    let(:project_attrs) { attributes_for :project, user: current_user }
    let(:params) { { resource: project_attrs } }

    login_user

    include_examples 'success'
    include_examples 'change by count', Project, 1
    include_examples 'validate resource types', [id: :int, name: :string]
  end

  describe 'PUT #update' do
    subject { put :update, params: params }

    let(:project) { create :project, user: current_user }
    let(:model_params) { attributes_for :project, user: current_user }
    let(:params) { { resource: model_params, id: project.id } }

    login_user

    include_examples 'success'
    include_examples 'validate resource types', [id: :int, name: :string]
    include_examples 'bulk update', :name
  end

  describe 'DELETE #destroy' do
    subject { delete :destroy, params: params }

    let!(:project) { create :project, user: current_user }
    let(:params) { { id: project.id } }

    login_user

    include_examples 'success'
    include_examples 'validate resource types', [id: :int, name: :string]
    include_examples 'change by count', Project, -1
  end
end
