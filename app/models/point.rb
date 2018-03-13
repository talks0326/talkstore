# == Schema Information
#
# Table name: points
#
#  id         :integer          not null, primary key
#  user_id    :integer          not null
#  point      :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Point < ApplicationRecord
	belongs_to :user
	has_many :point_transitions
end
