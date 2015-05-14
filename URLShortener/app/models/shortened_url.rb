# == Schema Information
#
# Table name: shortened_urls
#
#  id           :integer          not null, primary key
#  long_url     :string           not null
#  short_url    :string
#  submitter_id :integer          not null
#  created_at   :datetime
#  updated_at   :datetime
#

class ShortenedUrl < ActiveRecord::Base
  validates :submitter_id, presence: true
  validates :long_url, presence: true
  validates :short_url, uniqueness: true

  def self.create_for_user_and_long_url!(user, long_url)
    ShortenedUrl.create!(
      long_url: long_url,
      short_url: ShortenedUrl.random_code,
      submitter_id: user.id
    )
  end

  def self.random_code
    loop do
      short_code = SecureRandom.urlsafe_base64(16)
      return short_code unless exists?(short_url: short_code)
    end
  end

  def num_clicks
    visits.count
  end

  def num_uniques
    visitors.count
  end

  def num_recent_uniques
    visitors.where("visits.created_at > ?", 10.minutes.ago).count
  end

  belongs_to(
    :submitter,
    class_name: 'User',
    foreign_key: :submitter_id,
    primary_key: :id
  )

  has_many(
    :visits,
    class_name: 'Visit',
    foreign_key: :url_id,
    primary_key: :id
  )

  has_many :visitors, -> { distinct }, through: :visits, source: :visitors


end
