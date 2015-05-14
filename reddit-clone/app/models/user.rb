# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  username        :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#  created_at      :datetime
#  updated_at      :datetime
#

class User < ActiveRecord::Base
  validates :username, :session_token, uniqueness: true, presence: true
  validates :password_digest, presence: true

  has_many(
    :posts,
    primary_key: :id,
    foreign_key: :author_id,
    class_name: 'Post'
  )
  has_many(
    :subs,
    primary_key: :id,
    foreign_key: :moderator_id,
    class_name: 'Sub'
  )

  after_initialize :enforce_session_token

  def self.generate_session_token
    loop do
      token = SecureRandom.urlsafe_base64
      return token unless User.exists?(session_token: token)
    end
  end

  def self.find_by_credentials(params)
    user = User.find_by_username(params[:username])
    user.is_password?(params[:password]) ? user : nil
  end

  def reset_session_token!
    self.session_token = User.generate_session_token
    self.save
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  def enforce_session_token
    self.session_token ||= User.generate_session_token
  end

end
