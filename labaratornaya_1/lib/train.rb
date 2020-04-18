# frozen_string_literal: true

# Describes the train
class Train
  attr_reader :id
  def initialize(id, stops = [])
    @id = id
    @stops = stops
  end

  def to_s
    "#{@stops.first} #{@stops.last}"
  end

  def each_stop
    return enum_for(:each_stop) unless block_given?

    @stops.each do |stop|
      yield stop
    end
  end
end
