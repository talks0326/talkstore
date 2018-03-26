class ApplyController < ApplicationController
  before_action :authenticate_user!
  before_action :set_ticket,only: [:show,:offer]
  def index
  	@tickets = Ticket.effectiveness
  end

  def show
  	@ticket = Ticket.find(params[:id])
  end

  def offer
  	ticket = Ticket.find(params[:id])
    offer = Offer.where(user_try_id: current_user.user_tries.last.id,ticket_id: ticket.id)
    if offer.bank?
      offer = current_user.user_tries.last.offers.build
      offer.ticket_id = @ticket.id
      if offer.save
        to = ticket.ticket_offers.build
        to.offer_id = offer.id
        to.save
        current_user.user_tries.last.state_machine.transition_to(:apply)
        UserMailer.recruit(ticket.user_try.user).deliver!
      end
    end
  	redirect_to root_path
  end

  def mattching
    @ticket = mattching_ticket
    @offer = @ticket.offer
    current_user.user_tries.last.state_machine.transition_to(:end)
  end

  private
  def set_ticket
  	@ticket = Ticket.find(params[:id])
  end

  def mattching_ticket
    current_user.user_tries.last.offers.each do |offer|
      next if offer.ticket.blank?
      if offer.ticket.offer_id == offer.id
        return offer.ticket
      end
    end
  end
end
