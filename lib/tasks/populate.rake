namespace :db do
  desc "Clear the database and fill with excellent sample data."

  task populate: :environment do
    require 'populator'
    require 'faker'

    # Clear out the old junk
    [Artist, Song].each { |i| i.destroy_all }

    # Add genres, artists,and songs
    Genre.all.each do |genre|
      # genre.name = Faker::Hacker.noun

        Artist.populate 5..10 do |artist|
          artist.name = Faker::Pokemon.name
          artist.genre_id = genre.id

          Song.populate 10..20 do |song|
            song.name = Faker::Company.catch_phrase
            song.artist_id = artist.id
          end
        end
    end

    # Show a done message
    puts "Done populating!"

  end
end