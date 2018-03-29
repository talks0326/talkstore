class Admin::DashboardController < Admin::ApplicationController
  def index
  	@start = []
  	@pending_ticket = []
  	@pending_apply = []
  	@recruit = []
  	@apply = []
  	@establish_host = []
  	@establish_guest = []
  	@mattching = []
  	@end = []
  	@cancel = []
  	@none = []
  	users = User.all
	users.each do |u|
		user_try = u.user_tries.last
		if user_try.blank?
			@none.push(u)
			next
		end
		case user_try.state_machine.current_state
		when "start"
			@start.push(u)
		when "pending"
			if u.profile.gender
				@pending_ticket.push(u)	
			else
				@pending_apply.push(u)	
			end
		when "recruit"
			@recruit.push(u)
		when "apply"
			@apply.push(u)
		when "establish_host"
			@establish_host.push(u)
		when "establish_guest"
			@establish_guest.push(u)
		when "mattching"
			@mattching.push(u)
		when "end"
			@end.push(u)
		when "cancel"
			@cancel.push(u)
		end
	end
  end

  def show
  end
end
