# == Schema Information
#
# Table name: reviews
#
#  id           :integer          not null, primary key
#  user_id      :integer          not null
#  ticket_id    :integer          not null
#  impression   :boolean
#  conversation :boolean
#  want_meet    :boolean
#  usability    :boolean
#  price        :boolean
#  reuse        :boolean
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Review < ApplicationRecord
	belongs_to :user,optional: true
	belongs_to :ticket,optional: true
end
