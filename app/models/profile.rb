# == Schema Information
#
# Table name: profiles
#
#  id                 :integer          not null, primary key
#  user_id            :integer          not null
#  gender             :boolean          not null
#  name               :string(255)      not null
#  birth_place        :string(255)
#  birthday           :date
#  default_talk_theme :string(255)
#  self_introduction  :text(65535)
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

class Profile < ApplicationRecord
	belongs_to :user
	has_one :photo,as: :photable

	accepts_nested_attributes_for :photo,allow_destroy: true
end
