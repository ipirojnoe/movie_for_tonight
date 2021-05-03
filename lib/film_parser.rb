require 'nokogiri'
require 'open-uri'
require_relative 'film'

module FilmParser
  WIKI_LINK = 'https://ru.wikipedia.org/wiki/250_лучших_фильмов_по_версии_IMDb'.freeze

  extend self

  def from_wiki
    html = open_request(WIKI_LINK)
    doc = Nokogiri::HTML(html)

    films_list = doc.css('tbody/tr')[1..]

    films_list.map do |tr|
      cells = tr.css('td/a')

      Film.new(
        cells[0].text,
        cells[2].text,
        cells[1].text.to_i
      )
    end
  end

  private

  def open_request(url)
    URI.open(URI.escape(url))
  end
end
