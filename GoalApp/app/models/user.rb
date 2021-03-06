# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  username        :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ActiveRecord::Base
  validates :username, :session_token, :password_digest, presence: true
  validates :username, :session_token, uniqueness: true
  validates :password, length: {minimum: 6, allow_nil: true}

  attr_reader :password
  before_validation :ensure_session_token

  has_many :goals

  def self.find_by_credentials(username, password)
    user = User.find_by_username(username)
    return nil if user.nil?
    user.is_password?(password) ? user : nil
  end

  def is_password?(password)
    self.password_digest.is_password?(password)
  end

  def password_digest
    BCrypt::Password.new(super)
  end

  def password=(plaintext)
    self.password_digest = BCrypt::Password.create(plaintext)
    @password = plaintext
  end

  def reset_session_token!
    self.session_token = generate_session_token
    save!
    self.session_token
  end

  def generate_session_token
    SecureRandom.urlsafe_base64
  end

  private
  def ensure_session_token
    self.session_token ||= generate_session_token
  end
end
