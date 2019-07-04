# frozen_string_literal: true

class ApiController < ApplicationController
  include DeviseTokenAuth::Concerns::SetUserByToken

  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit :sign_up, keys: %i[username email password password_confirmation]
  end

  # for sign_in with username or email
  def find_resource(_field, value)
    query = <<-SQL.squish
      LOWER(username) = :value OR LOWER(email) = :value
    SQL

    @resource = resource_class.where(query, value: value).first
  end
end
