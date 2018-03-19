# == Schema Information
#
# Table name: offers
#
#  id         :integer          not null, primary key
#  user_id    :integer          not null
#  ticket_id  :integer          not null
#  end        :boolean          default(FALSE)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Offer < ApplicationRecord
	belongs_to :user_try
	belongs_to :ticket
	has_many :ticket_offers
end
