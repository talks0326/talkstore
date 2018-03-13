# == Schema Information
#
# Table name: user_tries
#
#  id         :integer          not null, primary key
#  user_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class UserTry < ApplicationRecord
	include Statesman::Adapters::ActiveRecordQueries
	
	belongs_to :user,optional: true
	has_many :user_transitions, autosave: false

	def state_machine
	  @state_machine ||= UserStateMachine.new(self, transition_class: UserTransition)
	end

	def self.transition_class
	  UserTransition
	end

	def self.initial_state
	  :start
	end
	private_class_method :initial_state
end
