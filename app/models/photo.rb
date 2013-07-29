# == Schema Information
#
# Table name: photos
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  image      :string(255)
#  name       :string(255)
#

class Photo < ActiveRecord::Base
  belongs_to :user
  attr_accessible :user_id, :image, :name

  mount_uploader :image, ImageUploader
end
