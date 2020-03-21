require_relative 'my_complex'

first_obj=MyComplex.new(-2,4)
second_obj=MyComplex.new(10,13)

#Печать информации о первом объекте
p first_obj
puts first_obj
puts "Real = #{first_obj.real}"
puts "Imaginary = #{first_obj.imaginary}"

#Печать информации о втором объекте
p second_obj
puts second_obj
puts "Real = #{second_obj.real}"
puts "Imaginary = #{second_obj.imaginary}"

#Сложение первого и второго комплексного числа , в новый объект
third_obj=first_obj.add(second_obj)
puts "Результат сложения #{third_obj}"

#Вычитание, из второго к.ч, первого , результат новый объект
fourth_obj=first_obj.sub(second_obj)
puts "Результат вычитания #{fourth_obj}"

#Умножение двух комплексных чисел, результат новый объект
fifth_obj=first_obj.multiply(second_obj)
puts "Результат умножения #{fifth_obj}"

#Деление второго комплексного числа, на первое, результат новый объект
sixth_obj=first_obj.divide(second_obj)
puts "Результат деления #{sixth_obj}"
