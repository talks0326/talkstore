# == Schema Information
#
# Table name: tickets
#
#  id         :integer          not null, primary key
#  user_id    :integer          not null
#  place      :string(255)      not null
#  point      :integer          not null
#  time       :datetime         not null
#  offer_id   :integer
#  end        :boolean          default(FALSE)
#  talk_theme :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Ticket < ApplicationRecord
	belongs_to :user_try,optional: true
	has_many :ticket_offers
	has_many :messages
	has_many :reviews
	belongs_to :offer,optional: true

	def self.effectiveness
	  where("end = ?",false)
	end
end
