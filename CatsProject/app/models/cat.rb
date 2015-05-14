# == Schema Information
#
# Table name: cats
#
#  id          :integer          not null, primary key
#  color       :string           not null
#  name        :string           not null
#  sex         :string(1)        not null
#  birth_date  :date             not null
#  description :text
#  created_at  :datetime
#  updated_at  :datetime
#

class Cat < ActiveRecord::Base
  validates :color, inclusion: { in: %w(black brown gray white orange),
            message: "Color must be black, brown, gray, white, or orange" }
  validates :birth_date, :name, presence: true
  validates :sex, inclusion: { in: ["M", "F"], message: "Sex must be M or F" }
  validate :birth_date_validator

  has_many :cat_rental_requests, dependent: :destroy

  def age
    Date.current.year - birth_date.year
  end

  def birth_date_validator
    if birth_date && birth_date > Date.today
      errors.add(:birth_date, "No time-travelling cats")
    end
  end
end
