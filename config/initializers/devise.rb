# frozen_string_literal: true

Devise.setup do |config|
  config.password_length = 8..128
  config.authentication_keys = [:login]
end
