# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  confirmation_token     :string(255)
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  unconfirmed_email      :string(255)
#  failed_attempts        :integer          default(0), not null
#  unlock_token           :string(255)
#  provider               :string(255)
#  uid                    :string(255)
#  token                  :string(255)
#  locked_at              :datetime
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
require 'rubygems'
require 'rmagick'
class User < ApplicationRecord
	include Statesman::Adapters::ActiveRecordQueries
	devise :database_authenticatable, :registerable,
	     :recoverable, :rememberable, :trackable, :validatable,:omniauthable, :omniauth_providers => [:facebook]

	has_one :profile
	has_one :point
	has_many :locales,as: :localable
	has_many :messages
	has_many :offers
	has_many :reviews
	#has_many :tickets
	has_many :point_transitions
	has_many :user_tries



	def self.find_for_oauth(auth)
		user = User.where(uid: auth.uid, provider: auth.provider).first

		unless user
		  user = User.create(
		    uid:      auth.uid,
		    provider: auth.provider,
		    email:    auth.info.email,
		    password: Devise.friendly_token[0, 20]
		  )
		  profile = user.build_profile 
		  profile.name = auth.info.name
		  profile.gender = auth.info.gender.eql?("male") ? 0 : 1
		  profile.save

		  photo = profile.build_photo
		
		  photo.photo_type = 1
		  url = auth.info.image
		  image_url = open(url)
		  extension = image_url.content_type.split("/")[1]
		  temp_images = Magick::Image.from_blob(image_url.read)
		  temp_images[0].write(url = "/tmp/#{profile.name}#{extension}")
		  photo.data = File.open(url)
		  photo.save

		  user.user_tries.create
		end
	
		user
	end

	def check_ticket_offers?(ticket)
		offers = self.user_tries.last.offers
		offers.map{|o| o.ticket_id}.include?(ticket.id)
	end

	def get_status(start_day,end_day)
		
	end
end
