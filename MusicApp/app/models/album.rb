# == Schema Information
#
# Table name: albums
#
#  id         :integer          not null, primary key
#  band_id    :integer          not null
#  category   :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Album < ActiveRecord::Base
  ALBUM_CATEGORIES = %w(live studio)
  validates :band_id, :category, presence: true
  validates :category, inclusion: {in: ALBUM_CATEGORIES}
end
