# frozen_string_literal: true

Devise.setup do |config|
  config.password_length = 8..128
end
