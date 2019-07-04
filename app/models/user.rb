# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id                 :bigint           not null, primary key
#  provider           :string           default("email"), not null
#  uid                :string           default(""), not null
#  encrypted_password :string           default(""), not null
#  email              :string           not null
#  username           :string           not null
#  tokens             :json
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

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
