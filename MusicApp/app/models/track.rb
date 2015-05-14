# == Schema Information
#
# Table name: tracks
#
#  id         :integer          not null, primary key
#  album_id   :integer          not null
#  name       :text             not null
#  lyrics     :text
#  category   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Track < ActiveRecord::Base
  TRACK_CATEGORIES = %w(bonus regular)
  validates :album_id, :name, presence: true
  validates :category, inclusion: {in: TRACK_CATEGORIES,
      message: "category can only be bonus or regular"}
end
