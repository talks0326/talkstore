task 'ticket:reset' => :environment do
	now = DateTime.now
	target_day = DateTime.new(now.year,now.month,now.day - 1)
	user_tries = UserTry.where("created_at > ?",target_day)
	user_tries.each do |ut|
		p ut.inspect
		next if ut.user.blank?
		ut.user.user_tries.create
		ut.user.user_tries.last.state_machine.transition_to(:pending)
	end
	Ticket.update_all(end: true)
	Offer.update_all(end: true)
end