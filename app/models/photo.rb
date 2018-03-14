# == Schema Information
#
# Table name: photos
#
#  id                :integer          not null, primary key
#  photable_type     :string(255)      not null
#  photable_id       :integer          not null
#  photo_type        :integer
#  url               :string(255)
#  data_file_name    :string(255)
#  data_content_type :string(255)
#  data_file_size    :integer
#  data_updated_at   :datetime
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

class Photo < ApplicationRecord
	belongs_to :photable,polymorphic: true, optional: true

	has_attached_file :data, styles: { sp_large: "800x450#",sp_thumb: "160x90#",large:"400x400#",medium:"200x200#" , thumb: "100x100#" }, default_url: "missing.png"
	validates_attachment_content_type :data, content_type: /\Aimage\/.*\z/
end
