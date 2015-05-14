# == Schema Information
#
# Table name: cat_rental_requests
#
#  id         :integer          not null, primary key
#  cat_id     :integer          not null
#  start_date :datetime         not null
#  end_date   :datetime         not null
#  status     :string           default("PENDING")
#  created_at :datetime
#  updated_at :datetime
#

class CatRentalRequest < ActiveRecord::Base
  validates :cat_id, :start_date, :end_date, presence: true
  validates :status, inclusion: { in: ["PENDING", "APPROVED", "DENIED"],
     message: "Status must be PENDING, APPROVED, or DENIED" }
  validate :overlapping_approved_requests

  belongs_to :cat

  def date_in_range(start_date, end_date, questionable)
    questionable > start_date && questionable < end_date
  end

  def overlapping_requests
    overlaps =[]
    requests = CatRentalRequest.all.select { |request| request.cat_id = cat_id }

    requests.each do |request|
      request_start = date_in_range(start_date, end_date, request.start_date)
      request_end = date_in_range(start_date, end_date, request.end_date)
      our_start = date_in_range(request.start_date, request.end_date, start_date)
      our_end = date_in_range(request.start_date, request.end_date, end_date)

      if id != request.id && (request_start || request_end || our_start || our_end)
        overlaps << request
      end
    end

    overlaps
  end

  def overlapping_approved_requests
    overlapping_requests.each do |request|
      if request.status == "APPROVED"
        errors.add(:overlap, "The cat is already rented during that time")
        return
      end
    end
  end
end
