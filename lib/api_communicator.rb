require 'rest-client'
require 'json'
require 'pry'

# def make_search
#   #make the web request
#   all_characters = RestClient.get('http://www.swapi.co/api/people/')
#   character_hash = JSON.parse(all_characters)
# end

def make_search(url)
  #make the web request
  data = RestClient.get url
  JSON.parse(data)
end

def get_character_movies_from_api(character)
character_hash = make_search('http://www.swapi.co/api/people/')
films_array = []
  character_hash["results"].each do |item|
    if item["name"].downcase == character
      item["films"].each do |film|
        # film_info = RestClient.get film 
        # film_info_hash = JSON.parse(film_info)
         film_info_hash = make_search(film)
        films_array << film_info_hash
      end 
    end
  end 
  #films_array   #all the info on films an array of hashes
  parse_character_movies(films_array) 
end

  # iterate over the character hash to find the collection of `films` for the given
  #   `character`
  # collect those film API urls, make a web request to each URL to get the info
  #  for that film
  # return value of this method should be collection of info about each film.
  #  i.e. an array of hashes in which each hash reps a given film
  # this collection will be the argument given to `parse_character_movies`
  #  and that method will do some nice presentation stuff: puts out a list
  #  of movies by title. play around with puts out other info about a given film.

  # some iteration magic and puts out the movies in a nice list
def parse_character_movies(films_array)   #films_hash
  count = 1
  films_array.each do |current_film|
    puts "#{count}. #{current_film['title']}, released: #{current_film['release_date']}"
    count += 1
  end
end

# def show_character_movies(character)
#   films_hash = get_character_movies_from_api(character)
#   parse_character_movies(films_hash)
# end

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?

def get_movie_characters_from_api(movie)
movie_hash = make_search('http://www.swapi.co/api/films/')
characters_array = []
  movie_hash["results"].each do |item|
    if item["title"].downcase == movie
      item["characters"].each do |character|   #urls 
         character_info_hash = make_search(character)
        characters_array << character_info_hash
      end 
    end
  end 
  #characters_array  #all the info on films an array of hashes
  parse_movie_character(characters_array)
end

def parse_movie_character(characters_array)
  count = 1
  characters_array.each do |current_character|
    puts "#{current_character['name']}, who is #{current_character['eye_color']}-eyed"
    count += 1
  end
end




