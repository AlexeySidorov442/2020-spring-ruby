# frozen_string_literal: true

# Class for raiting
class RaitingCreator

    require 'csv'
    require_relative 'movie_list'
    require_relative 'movie'

  def create
    reader = MovieList.new
    ARGV[0].each do |csv_file_name|
      reader.read_data(csv_file_name)
     end
     
     CSV.open(ARGV[1],"w") do |wr|
        wr << ["Title","raiting Movie Fire"]
        reader.movie.sort.each do |value|
            wr << [value]
        end
    end
    end
  
end
