# frozen_string_literal: true

module Rendering
  module Data
    extend ActiveSupport::Concern

    private

    def render_resources(resources, options = {}) # rubocop: disable all
      pagination = options[:pagination].nil? || options.delete(:pagination)

      meta = {}
      if pagination
        resources = resources.page(params[:page]).per(params[:per_page]).padding(params[:padding])

        meta = { page: params[:page], per_page: params[:per_page], padding: params[:padding] }

        meta[:total_pages] = resources.total_pages if options.dig(:meta, :total_pages).blank?
      end

      render json: resources, root: :resources, meta: meta, **options
    end

    def render_resource_or_errors(resource, options = {})
      if resource.errors.present?
        render_errors resource
      else
        render_resource(resource, options)
      end
    end

    def render_resource(resource, options = {})
      render json: resource, root: :resource, **options
    end

    def render_errors(resource)
      render json: { errors: resource.errors }, status: :unprocessable_entity
    end

    def render_operation(operation, rendering_object, serializer)
      if operation.run
        render_resource(operation.send(rendering_object), serializer: serializer)
      else
        render_errors operation
      end
    end
  end
end
