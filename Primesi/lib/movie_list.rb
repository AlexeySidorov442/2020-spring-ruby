require 'csv'
require_relative 'movie.rb'

class MovieList
    
    attr_accessor :films

    include Enumerable


    def initialize
        table = CSV.parse(File.read(__dir__ + "/../data/input.csv"), headers: true)
        @films = table.map do |obj|
            Movie.new(obj["title"], obj["kinopoisk"],  obj["imdb"], obj["metacritic"], obj["rotten_tomatoes"])
        end
        @films = @films.sort.reverse
    end

    def each(&block)
        @films.each(&block)
    end
   
end