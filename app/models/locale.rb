# == Schema Information
#
# Table name: locales
#
#  id             :integer          not null, primary key
#  localable_type :string(255)      not null
#  localable_id   :integer          not null
#  latitude       :float(24)        not null
#  longitude      :float(24)        not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Locale < ApplicationRecord
	belongs_to :localable,polymorphic: true, optional: true
end
