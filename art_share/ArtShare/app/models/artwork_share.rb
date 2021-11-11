# == Schema Information
#
# Table name: artwork_shares
#
#  id         :bigint           not null, primary key
#  artwork_id :integer          not null
#  viewer_id  :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class ArtworkShare < ApplicationRecord
   belongs_to :artwork,
     primary_key: :id,
     foreign_key: :artwork_id,
     class_name: :ArtWork

    belongs_to :viewer,
     primary_key: :id,
     foreign_key: :viewer_id,
     class_name: :User

    has_many :shared_viewers,
      through: :viewer,
      source: :artworks
      
end
