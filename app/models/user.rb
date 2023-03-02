class User < ApplicationRecord
  validates :spotify_id, presence: true, uniqueness: true

  has_many :games, dependent: :destroy

  def spotify_client
    # create and return a new instance of the `RSpotify::User` class using the user's access token
  end
end