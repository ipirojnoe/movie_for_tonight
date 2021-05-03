require_relative 'lib/film_collection'

puts 'Программа "Фильм на вечер"'

film_collection = FilmCollection.read(source: :wiki)
directors = film_collection.directors

directors.each.with_index(1) do |director, index|
  puts "#{index}: #{director}"
end

puts
puts "Выберите режиссёра на сегодня:"

user_input = nil
loop do
  user_input = gets.to_i
  break if user_input.between?(1, directors.size)
end

user_choice = directors[user_input - 1]

puts "Сегодня можно посмотреть:"
puts film_collection.select_film(user_choice)
