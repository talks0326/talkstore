# == Schema Information
#
# Table name: point_transitions
#
#  id          :integer          not null, primary key
#  point_id    :integer          not null
#  to_state    :string(255)      not null
#  metadata    :text(65535)
#  sort_key    :integer          not null
#  most_recent :boolean
#  chenge_type :integer          not null
#  target_id   :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class PointTransition < ApplicationRecord
	belongs_to :point
	belongs_to :target,class_name: "User"
end
