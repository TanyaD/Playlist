class User < ActiveRecord::Base
  has_secure_password
  has_many :songs
  has_many :user_songs 
  has_many :songs_added, through: :user_songs, source: :song

  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :first_name, :last_name, presence: true, length: {in: 2..20}
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }
  validates :password, length: { in: 7..20 }, on: :create
end
