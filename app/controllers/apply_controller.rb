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
  	offer = current_user.offers.build
  	offer.ticket_id = @ticket.id
  	if offer.save
  		to = ticket.ticket_offers.build
  		to.offer_id = offer.id
  		to.save
  		current_user.user_tries.last.state_machine.transition_to(:apply)
  	end
  	redirect_to root_path
  end

  private
  def set_ticket
  	@ticket = Ticket.find(params[:id])
  end
end
