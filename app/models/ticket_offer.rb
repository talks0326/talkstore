# == Schema Information
#
# Table name: ticket_offers
#
#  id         :integer          not null, primary key
#  ticket_id  :integer          not null
#  offer_id   :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class TicketOffer < ApplicationRecord
	belongs_to :ticket,optional: true
	belongs_to :offer,optional: true
end
