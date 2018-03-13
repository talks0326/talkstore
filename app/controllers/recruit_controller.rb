class RecruitController < ApplicationController
  before_action :authenticate_user!
  before_action :set_ticket_offer,only: [:show,:choose]
  before_action :set_ticket
  def index
    @ticket_offers = @ticket.ticket_offers
  end

  def show
  end

  def choose
    @ticket.offer_id = @offer.id
    @ticket.end = true
    if @ticket.save
      @ticket.user.user_tries.last.state_machine.transition_to(:establish_host)
      @offer.user.user_tries.last.state_machine.transition_to(:establish_guest)
    end
  end

  private
  def set_ticket
    @ticket = current_user.tickets.last
  end 
  
  def set_ticket_offer
    @offer = Offer.find(params[:id])
  end
end
