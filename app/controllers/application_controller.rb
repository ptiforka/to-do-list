# frozen_string_literal: true

class ApplicationController < ActionController::API
  include Rendering::Data
  include Rendering::Errors
end
