# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  username   :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class User < ApplicationRecord
    validates :username, uniqueness: true

    has_many :artworks,
      primary_key: :id,
      foreign_key: :artist_id,
      class_name: :ArtWork

    has_many :viewers,
      primary_key: :id,
      foreign_key: :viewer_id,
      class_name: :ArtWorkShare

    has_many :artwork_shares,
      primary_key: :id,
      foreign_key: :artwork_id,
      class_name: :ArtWorkShare

    has_many :shared_artworks,
      through: :artwork_shares, 
      source: :artwork
end
