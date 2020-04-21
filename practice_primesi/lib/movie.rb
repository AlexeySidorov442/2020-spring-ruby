# frozen_string_literal: true

# Class Movie
class Movie
    include Comparable
 
  def initialize(title, kinopoisk, imdb, metacritic, rotten_tomatoes)
    @title = title
    @kinopoisk = Float(kinopoisk)
    @imdb = Float(imdb)
    @metacritic = Float(metacritic)
    @rotten_tomatoes = Float(rotten_tomatoes)
  end

  def ogon_rating
    (@imdb + @kinopoisk + (@metacritic + @rotten_tomatoes) / 2) / 3
  end

  def to_s
    "#{@title} :#{ogon_rating}"
  end

  def <=>(other)
     self.ogon_rating <=> other.ogon_rating
  end
end
