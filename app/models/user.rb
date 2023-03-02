# == Schema Information
#
# Table name: users
#
#  id                    :bigint           not null, primary key
#  spotify_id            :string
#  spotify_access_token  :string
#  spotify_refresh_token :string
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#
class User < ApplicationRecord
  validates :spotify_id, presence: true, uniqueness: true

  has_many :games, dependent: :destroy

  def spotify_client
    # create and return a new instance of the `RSpotify::User` class using the user's access token
  end
end
