# frozen_string_literal: true

# Class Movie
class Movie
    include Comparable
  attr_reader :title
  attr_reader :kinopoisk
  attr_reader :imdb
  attr_reader :metacritic
  attr_reader :rotten_tomatoes
  require_relative 'movie_list'

  def initialize(title, kinopoisk, imdb, metacritic, rotten_tomatoes)
    @title = title
    @kinopoisk = Float(kinopoisk)
    @imdb = Float(imdb)
    @metacritic = Float(metacritic)
    @rotten_tomatoes = Float(rotten_tomatoes)
  end

  def ogon_rating
    (imdb + kinopoisk + (metacritic + rotten_tomatoes) / 2) / 3
  end

  def to_s
    "Movie: #{title}. Rating fire: #{ogon_rating}"
  end

  def <=>(other)
     ogon_rating <=> other.ogon_rating
  end
end
