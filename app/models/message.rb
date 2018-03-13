# == Schema Information
#
# Table name: messages
#
#  id         :integer          not null, primary key
#  from_id    :integer          not null
#  to_id      :integer          not null
#  ticket_id  :integer          not null
#  content    :text(65535)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Message < ApplicationRecord
	belongs_to :from,class_name: "User",optional: true
	belongs_to :to,class_name: "User",optional: true
	belongs_to :ticket,optional: true
end
