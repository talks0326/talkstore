module ApplicationHelper
	def get_age(birthday)
	  date_format = "%Y%m%d"
	  (Date.today.strftime(date_format).to_i - birthday.strftime(date_format).to_i) / 10000
	end
end
