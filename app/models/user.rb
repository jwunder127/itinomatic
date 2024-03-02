# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  avatar     :string
#  email      :string
#  first_name :string
#  last_name  :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class User < ApplicationRecord
  has_many :trips
  has_many :destinations, through: :trips
  has_many :photos, through: :destinations
end
