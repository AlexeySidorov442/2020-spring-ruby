# frozen_string_literal: true

# Hello it's my comment
class Fleet
  require 'json'
  attr_reader :cars

  def initialize
    @cars = []
  end

  def add(car)
    @cars.push(car)
  end

  def load_from_file(json_file_name)
    json_data = File.read(json_file_name)
    ruby_objects = JSON.parse(json_data)
    index = 0
    while ruby_objects.size != index
      add(Auto.new(ruby_objects[index]['mark'], ruby_objects[index]['model'],
                   ruby_objects[index]['year'], ruby_objects[index]['consumption']))
      index += 1
    end
  end

  def average_consumption
    index = 0
    avg_cons = 0
    while @cars.size != index
      avg_cons += @cars[index].gasoline_consumption
      index += 1
    end
    avg_cons /= @cars.size
    avg_cons
  end

  def number_by_brand(brand)
    index = 0
    number = 0
    while @cars.size != index
      number += 1 if @cars[index].brand == brand
      index += 1
    end
    number
  end

  def number_by_model(model)
    index = 0
    number = 0
    while @cars.size != index
      number += 1 if @cars[index].model == model
      index += 1
    end
    number
  end

  def consumption_by_brand(brand)
    index = 0 # Index array
    avg = 0   # count for average value
    value = 0 # count auto need brean
    while @cars.size != index
      if @cars[index].brand == brand # if equal , go
        avg += @cars[index].gasoline_consumption # for agv plus this value
        value += 1 # auto plus one
      end
      index += 1 # Index plus one, for next elem
    end
    avg /= value # get agerage and division him on count auto
    avg
  end
end
