class TimeKeeperController < ApplicationController
  def show
  	@ticket = Ticket.find(params[:id])
  	start_time = @ticket.user.user_tries.last.user_transitions.last.created_at
  	@left_second = 3600 - (Time.now.localtime.to_i - start_time.to_time.localtime.to_i)
  	if @left_second < 0
  		@ticket.user.user_tries.last.state_machine.transition_to(:review)
  		@ticket.offer.user.user_tries.last.state_machine.transition_to(:review)
  		redirect_to root_path
  	else
  	end
  end

  def time_end
  	@ticket = Ticket.find(params[:id])
  	@ticket.user.user_tries.last.state_machine.transition_to(:review)
  	@ticket.offer.user.user_tries.last.state_machine.transition_to(:review)

    if request.post?
      p "post !"
    else
      redirect_to root_path
    end
  end
end
