class MessagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_ticket
  def show
  	@messages = @ticket.messages
  	@message = @ticket.messages.build
  	if @ticket.user_id == current_user.id
  		@to = @ticket.offer.user
  	else
  		@to = @ticket.user
  	end
  end

  def post
  	@message = @ticket.messages.build(message_params)
  	@message.save
  end

  private
  def set_ticket
  	@ticket = Ticket.find(params[:id])
  end

  def message_params
	params.fetch(:message, {}).permit(message_attributes)
  end

  def message_attributes
	  [
	    :from_id,:to_id,:content
	  ]
  end
end
