# frozen_string_literal: true

module Rendering
  module Errors
    extend ActiveSupport::Concern

    included do
      rescue_from ActiveRecord::RecordNotFound do |exception|
        render json: { errors: exception.message }, status: :not_found
      end

      rescue_from ActionController::ParameterMissing do |exception|
        render json: { error: exception.message }, status: :bad_request
      end

      rescue_from ActiveRecord::RecordNotUnique do
        render json: { error: 'Duplicate key value violates unique constraint' }, status: :bad_request
      end
    end
  end
end
