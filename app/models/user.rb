# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ActiveRecord::Base
  validates :session_token, :email, :password_digest, :password, presence: true
  validates :session_token, :email, uniqueness: true
  validates :email, length: { minimum: 6 }
  before_validation :ensure_session_token
  attr_reader :password

  has_many :notes

  def self.find_by_creds(email, pw)
    user = User.find_by_email(email)
    if user && user.is_password?(pw)
      user
    else
      nil
    end
  end

  def password=(pw)
    @password = pw
    self.password_digest = BCrypt::Password.create(pw)
  end

  def ensure_session_token
    self.session_token = SecureRandom.urlsafe_base64
  end

  def reset_session_token!
    self.session_token = SecureRandom.urlsafe_base64
    self.save
  end

  def is_password?(pw)
    BCrypt::Password.new(self.password_digest).is_password?(pw)
  end
end
