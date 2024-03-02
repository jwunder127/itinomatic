# == Schema Information
#
# Table name: destinations
#
#  id          :integer          not null, primary key
#  description :text
#  name        :string
#  type        :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  trip_id     :integer
#
# Indexes
#
#  index_destinations_on_trip_id  (trip_id)
#
class Destination < ApplicationRecord
  belongs_to :trip
  has_many :photos
end
