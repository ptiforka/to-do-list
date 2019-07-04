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

FactoryBot.define do
  factory :user do
    email    { Faker::Internet.email }
    username { Faker::Internet.unique.user_name(3) }
    password { '12345678' }
  end
end
