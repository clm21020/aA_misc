# == Schema Information
#
# Table name: visits
#
#  id         :integer          not null, primary key
#  visitor_id :integer          not null
#  url_id     :integer          not null
#  created_at :datetime
#  updated_at :datetime
#

class Visit < ActiveRecord::Base
  validates :visitor_id, presence: true
  validates :url_id, presence: true

  def self.record_visit!(user, shortened_url)
    Visit.create!(visitor_id: user.id, url_id: shortened_url.id)
  end

  belongs_to(
    :visitors,
    class_name: 'User',
    foreign_key: :visitor_id,
    primary_key: :id
  )

  belongs_to(
    :urls,
    class_name: 'ShortenedUrl',
    foreign_key: :url_id,
    primary_key: :id
  )

end
