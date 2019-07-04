# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :validatable

  include DeviseTokenAuth::Concerns::User

  attr_writer :login

  validates :username, uniqueness: true, presence: true, length: { in: 3..50 }, format: /\A[a-zA-Z0-9_\.]*\z/

  private

  def login
    @login || username || email
  end
end
