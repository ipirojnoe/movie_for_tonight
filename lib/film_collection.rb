require_relative 'film_parser'

class FilmCollection
  attr_reader :films

  def self.read(source:)
    case source
    when :wiki
      new(FilmParser::from_wiki)
    end
  end

  def initialize(films)
    @films = films
  end

  def directors
    @directors ||= @films.map(&:director).uniq.sort
  end

  def select_film(director)
    @films.select { |film| film.director == director }.sample
  end
end
