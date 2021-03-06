# frozen_string_literal: true

Rails.application.routes.draw do
  scope :api do
    mount_devise_token_auth_for 'User', at: 'auth'

    resources :projects, except: :show
  end
end
