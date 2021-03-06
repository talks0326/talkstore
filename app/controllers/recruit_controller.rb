class RecruitController < ApplicationController
  before_action :authenticate_user!
  before_action :set_ticket_offer,only: [:show,:choose]
  before_action :set_ticket
  def index
    @ticket_offers = TicketOffer.where(ticket_id: @tickets.map{|t| t.id})
  end

  def show
  end

  def choose
    @ticket.offer_id = @offer.id
    if @ticket.end == true
      logger.debug("done")
    else
      @ticket.end = true
      if @ticket.save
        @ticket.user_try.tickets.update_all(end: true)
        offer = @ticket.offer
        offer.end = true
        offer.save
        offer.user_try.offers.update_all(end: true)
        @ticket.user_try.state_machine.transition_to(:establish_host)
        @offer.user_try.state_machine.transition_to(:establish_guest)
        UserMailer.mattching_men(@offer.user_try.user).deliver!
        UserMailer.admin_notice(@ticket.user_try.user,@offer.user_try.user).deliver!
      end
    end
  end

  private
  def set_ticket
    @tickets = current_user.user_tries.last.tickets
  end 
  
  def set_ticket_offer
    @offer = Offer.find(params[:id])
    @ticket = @offer.ticket_offers.last.ticket
  end
end
