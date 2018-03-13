# == Schema Information
#
# Table name: user_transitions
#
#  id          :integer          not null, primary key
#  user_try_id :integer          not null
#  to_state    :string(255)      not null
#  metadata    :text(65535)
#  sort_key    :integer          not null
#  most_recent :boolean
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class UserTransition < ApplicationRecord
	include Statesman::Adapters::ActiveRecordTransition

  	belongs_to :user_try, inverse_of: :user_transitions
end
