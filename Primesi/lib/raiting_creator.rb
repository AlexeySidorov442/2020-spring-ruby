require_relative "movie_list.rb"
class RaitingCreator

    def initialize
        @ml = MovieList.new
    end
    def save_raiting(path )
        File.open(path, "w+") do |f|
            @ml.each { |element| f.puts(element) }
        end
    end
    def show_min
        puts @ml.min
    end

    def show_max
        puts @ml.max
    end

    def list_movies
        @ml.each_with_index do |el, index|
            puts "#{index+1}: #{el}"
        end
    end
    def average_ogon_rating
        sum = @ml.reduce(0) { |total, el| total + el.count_rait }
        puts sum * 1.0 / @ml.count
    end
end