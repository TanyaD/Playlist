class Song < ActiveRecord::Base
  belongs_to :user
  has_many :user_songs
  has_many :users, through: :user_songs
end
