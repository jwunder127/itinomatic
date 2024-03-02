# == Schema Information
#
# Table name: photos
#
#  id             :integer          not null, primary key
#  description    :text
#  latitude       :float
#  longitude      :float
#  name           :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  destination_id :integer
#
# Indexes
#
#  index_photos_on_destination_id  (destination_id)
#
class Photo < ApplicationRecord
  belongs_to :destination
end
