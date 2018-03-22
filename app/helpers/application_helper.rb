module ApplicationHelper
	def get_age(birthday)
	  date_format = "%Y%m%d"
	  (Date.today.strftime(date_format).to_i - birthday.strftime(date_format).to_i) / 10000
	end

	def simple_format_v1(text)
	    return if text.blank?
	    return text.gsub(/\r\n|\r|\n/, "<br />").html_safe
	  end
end
