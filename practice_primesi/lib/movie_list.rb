#Class list movie
class MovieList

    require 'csv'
    attr_reader :movie

    def initialize
        @movie=[]
    end

    def read_data(csv_file_name)
        CSV.foreach(csv_file_name, headers:true) do |row|
             @movie << Movie.new(row['title'],row['kinopoisk'],row['imdb'],
                row['metacritic'],row['rotten_tomatoes'])
          end
    end

    
    
end