require_relative "../lib/raiting_creator.rb"

rc = RaitingCreator.new
rc.save_raiting(ARGV[0])
rc.show_min
rc.show_max
rc.list_movies
rc.average_ogon_rating