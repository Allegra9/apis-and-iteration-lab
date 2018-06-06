def welcome
  # puts out a welcome message here!
  puts "Welcome to Stars Wars!"
end

def get_user_choice
  puts "Enter 'c' to search by character or 'f' to search by film. 
Character => list of films the character has appeared in, Film => the characters of that film."
  input = gets.chomp.downcase
  if input == "c"
  	get_character_from_user
  elsif input == "f"
  	get_film_from_user
  else 
  	puts "Oh no, try again!"
  	get_user_choice
  end 
  # use gets to capture the user's input. This method should return that input, downcased.
end

def get_character_from_user
  puts "Please enter a film character's name to retrieve the list of films with him/her:"
  character = gets.chomp.downcase
  get_character_movies_from_api(character)
  # use gets to capture the user's input. This method should return that input, downcased.
end

#Luke Skywalker

def get_film_from_user
  puts "Please enter a film's name to retrieve the list of characters:"
  movie = gets.chomp.downcase
  get_movie_characters_from_api(movie)
  # use gets to capture the user's input. This method should return that input, downcased.
end

#A new Hope 
