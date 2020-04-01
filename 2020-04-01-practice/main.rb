# frozen_string_literal: true

require_relative 'my_complex'
require 'tty-prompt'
prompt = TTY::Prompt.new

first_obj = MyComplex.new(-2, 4)
second_obj = MyComplex.new(10, 13)

# Print info for first object
p first_obj
puts first_obj
puts "Real = #{first_obj.real}"
puts "Imaginary = #{first_obj.imaginary}"

# Print info for second object
p second_obj
puts second_obj
puts "Real = #{second_obj.real}"
puts "Imaginary = #{second_obj.imaginary}"

real = prompt.ask('Write real number', convert: :float, required: true)
imaginary = prompt.ask('Write imaginary number', convert: :float, required: true)
first_obj = MyComplex.new(real, imaginary)
real = prompt.ask('Write real number', convert: :float, required: true)
imaginary = prompt.ask('Write imaginary number', convert: :float, required: true)
second_obj = MyComplex.new(real, imaginary)

# Add first and second obj
third_obj = first_obj.add(second_obj)
puts "Результат сложения #{third_obj}"

# Substraction first and second obj
fourth_obj = first_obj.sub(second_obj)
puts "Результат вычитания #{fourth_obj}"

# Multiplication two object
fifth_obj = first_obj.multiply(second_obj)
puts "Результат умножения #{fifth_obj}"

# Division two object
sixth_obj = first_obj.divide(second_obj)
puts "Результат деления #{sixth_obj}"
