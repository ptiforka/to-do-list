# frozen_string_literal: true

# == Schema Information
#
# Table name: projects
#
#  id         :bigint           not null, primary key
#  name       :string
#  user_id    :bigint
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ProjectSerializer < ApplicationSerializer
  attributes %i[id name]
end
