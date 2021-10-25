# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'json'
require 'open-uri'

puts "Cleaning database..."
Movie.destroy_all
List.destroy_all

puts "Creating movies..."

url = "http://tmdb.lewagon.com/movie/top_rated"
movie_serialized = URI.open(url).read
movie_json = JSON.parse(movie_serialized)
movie_results = movie_json["results"]
movie_results.each do |m|
  movie = Movie.create!(
    title: m['title'],
    overview: m["overview"],
    poster_url: m["poster_path"],
    rating: m["vote_average"]
  )
  puts "Created #{movie.title}"
end

puts "Finished!"
