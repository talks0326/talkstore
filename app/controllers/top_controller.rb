class TopController < ApplicationController
  before_action :authenticate_user!
  def index
  	case current_user.user_tries.last.state_machine.current_state
  	when "start"
  		redirect_to profile_edit_path
  	when "pending"
  		if current_user.profile.gender
  			redirect_to new_ticket_path
  		else
  			redirect_to apply_index_path
  		end
  	when "recruit"
      redirect_to recruit_index_path
  	when "apply"
      redirect_to apply_index_path
    #ファーストリリース対応
  	when "establish_host"
      current_user.user_tries.last.state_machine.transition_to(:end)
      redirect_to root_path
      #redirect_to message_room_path(current_user.tickets.last)
  	when "establish_guest"
      redirect_to apply_mattching_path
      #redirect_to message_room_path(current_user.offers.last.ticket_offers.last.ticket)
  	when "matching"
      if current_user.profile.gender
        redirect_to time_keeper_path(current_user.tickets.last)
      else
        redirect_to time_keeper_path(current_user.offers.last.ticket_offers.last.ticket)
      end
  	when "review"
      if current_user.profile.gender
        redirect_to new_review_path(current_user.tickets.last)
      else
        redirect_to new_review_path(current_user.offers.last.ticket_offers.last.ticket)
      end
      
  	when "end"
  	when "cancel"
  	end
  end
end
