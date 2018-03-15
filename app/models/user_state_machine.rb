class UserStateMachine
  include Statesman::Machine

  state :start, initial: true
  state :pending
  state :recruit
  state :apply
  state :establish_host
  state :establish_guest
  state :matching
  state :review
  state :end
  state :cancel

  transition from: :start,      to: [:pending, :cancel]
  transition from: :pending,      to: [:recruit,:apply, :cancel]
  transition from: :recruit, to: [:establish_host, :cancel]
  transition from: :apply, to: [:establish_guest, :cancel]
  #ファーストリリース対応
  transition from: :establish_host, to: [:end]
  transition from: :establish_guest, to: [:end]
  #transition from: :establish_host,    to: [:matching, :cancel]
  #transition from: :establish_guest,    to: [:matching, :cancel]
  #transition from: :matching,      to: :review
  #transition from: :review,      to: :end

  after_transition(to: :end) do |user_try, transition|
    user = user_try.user
    user_try = user.user_tries.create
    user_try.state_machine.transition_to(:pending)
  end

end