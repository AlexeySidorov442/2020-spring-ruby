class Movie
    include Comparable
    def initialize(_name, _kinopoisk,  _imdb, _metacritic, _rotten_tomatoes)
        @name = _name
        @imdb = Integer(_imdb)
        @kinopoisk = Integer(_kinopoisk)
        @metacritic =Integer(_metacritic)
        @rotten_tomatoes = Integer(_rotten_tomatoes)
    end

    def <=>(anOther)
        self.count_rait <=> anOther.count_rait
    end

    def count_rait
        (@imdb + @kinopoisk + (@metacritic + @rotten_tomatoes) / 2) / 3    
    end
    def to_s
        "#{@name}:  #{count_rait}"
    end
end