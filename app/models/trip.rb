# == Schema Information
#
# Table name: trips
#
#  id          :integer          not null, primary key
#  description :text
#  name        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :integer
#
# Indexes
#
#  index_trips_on_user_id  (user_id)
#
class Trip < ApplicationRecord
  belongs_to :user
  has_many :destinations
end
