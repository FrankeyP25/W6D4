# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Artwork.destroy_all
ArtworkShare.destroy_all

# a = User.create({username: "Nick"})
# b = User.create({username: "Frankelin"})
# c = User.create({username: "Amin"})
# d = User.create({username: "KinKa"})
# e = User.create({username: "David"})

# new_users = [
#     User.create({username: "Nick"}), 
#     User.create({username: "Frankelin"}), 
#     User.create({username: "Amin"}), 
#     User.create({username: "KinKa"}), 
#     User.create({username: "David"})
# ]

artists = []
3.times do
    artists << User.create({username: Faker::Artist.unique.name})
end


artworks = []
artists.each do |artist|
    person_id = artist.id

    2.times do
        artworks << Artwork.create({title: Faker::Book.title, image_url: Faker::File.file_name(dir: 'namek', ext: 'jpg'), artist_id: person_id})
    end    
end


ArtworkShare.create({viewer_id: artists[0].id, artwork_id: artworks[1].id })
ArtworkShare.create({viewer_id: artists[1].id, artwork_id: artworks[1].id }) 
ArtworkShare.create({viewer_id: artists[2].id, artwork_id: artworks[1].id })
