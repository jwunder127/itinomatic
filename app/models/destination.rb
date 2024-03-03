# == Schema Information
#
# Table name: destinations
#
#  id               :integer          not null, primary key
#  description      :text
#  destination_type :integer
#  latitude         :float
#  longitude        :float
#  name             :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  trip_id          :integer
#
# Indexes
#
#  index_destinations_on_trip_id  (trip_id)
#
class Destination < ApplicationRecord
  belongs_to :trip
  has_many :photos

  enum destination_type: [:restaurant, :bar, :hotel, :activity, :other]
end
