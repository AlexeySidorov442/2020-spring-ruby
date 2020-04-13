# frozen_string_literal: true

# Join two file
require_relative 'auto'
require_relative 'fleet'
require 'tty-prompt'
prompt = TTY::Prompt.new

brend = prompt.ask('Write brend', required: true)
mark = prompt.ask('Write mark',required: true)
year = prompt.ask('Write year',required: true)
avg = prompt.ask('Write avg',required: true)





# Create two object
first_auto = Auto.new('BMW', 'X5 3,0D', 2017, 8.947288250510692)

second_auto = Auto.new('BMW', 'X5 3,0D', 2017, 9.956788220511692)

# Create object class Fleet
park_auto = Fleet.new

# USe for two object method add
# add to end array two object
park_auto.add(Auto.new(brend,mark,year,avg))
park_auto.add(first_auto)
park_auto.add(second_auto)

# read from file, and converted info for object
# create new object class Auto and add them to end array
park_auto.load_from_file('cars-list.json')

# print all methods
puts "Машин в авт.парке : #{park_auto.cars.size}"
puts "Ср.расход бензина всех авто : #{park_auto.average_consumption}"
puts "Кол-во авто определенного бренда : #{park_auto.number_by_brand('BMW')}"
puts "Кол-во авто определенной модели : #{park_auto.number_by_model('Civic 1,8i')}"
puts "Ср.расход бензина для авто заданного бренда : #{park_auto.consumption_by_brand('ВАЗ')}"
 #puts park_auto.cars
 puts "#{park_auto.cars[0]}"
