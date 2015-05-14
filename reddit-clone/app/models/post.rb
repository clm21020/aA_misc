# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  title      :string           not null
#  url        :string
#  content    :text
#  sub_id     :integer          not null
#  author_id  :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Post < ActiveRecord::Base
  validates :title, :author_id, presence: true
  validate :has_sub?

  belongs_to(
    :author,
    primary_key: :id,
    foreign_key: :author_id,
    class_name: 'User'
  )

  has_many :post_subs, dependent: :destroy

  has_many :subs, through: :post_subs

  private

    def has_sub?
      if self.subs.empty?
        flash[:errors] = "Post must have at least one Sub"
      end
    end
end
