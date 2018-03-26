module ApplicationHelper
	def get_age(birthday)
	  date_format = "%Y%m%d"
	  (Date.today.strftime(date_format).to_i - birthday.strftime(date_format).to_i) / 10000
	end

	def simple_format_v1(text)
	    return if text.blank?
	    return text.gsub(/\r\n|\r|\n/, "<br />").html_safe
	end

	def default_meta_tags
	    req_url = request.url.split('/')
	    req_url.length > 3 ? ogtype = 'article' : ogtype = 'website'
	    {
	      charset: 'utf-8',
	      site: "スーン",
	      reverse: true,
	      description: "",
	      keywords: "",
	      canonical: request.original_url,
	      viewport: "width=device-width,initial-scale=1",
	      og: {
	        title: "スーン",
	        type: "website",
	        url: request.original_url,
	        image: {
	          _: "https://talkstore.tokyo" + asset_path("soon_logo.png"),
	          width: '1024',
	          height: '1024'
	        },
	        site_name: "スーン",
	        description: "今日会いたいを叶えるマッチングアプリ！|スーン",
	        locale: 'ja_JP'
	      },
				fb: {
					app_id: '537592969957411'
				},
				twitter: {
	        site: '@designated_dev',
	        card: 'summary_large_image'
				}
	    }
	  end
end
