#Подключаем два файла
require_relative 'auto'
require_relative 'fleet'

#Создаем два объекта класа Auto с установленными параметрами
first_auto=Auto.new("BMW","X5 3,0D",2017,8.947288250510692)

second_auto=Auto.new("BMW","X5 3,0D",2017,9.956788220511692)

#Создаем объект класса Fleet 
park_auto=Fleet.new()

#Используем для объекта класса Fleet, метод add
#Который добавляет объект в конец массива cars
park_auto.add(first_auto)
park_auto.add(second_auto)

#Читаем данные с файла, преобразуем их в объекты и с помощью метода add
#Создаем новые объекты класса Auto, который добавляем в конец массива cars
park_auto.load_from_file('cars-list.json')

#Печать результатов всех методов
puts"Машин в авт.парке : #{park_auto.cars.size}"
puts "Ср.расход бензина всех авто : #{park_auto.average_consumption}"
puts "Кол-во авто определенного бренда : #{park_auto.number_by_brand('BMW')}"
puts "Кол-во авто определенной модели : #{park_auto.number_by_model('Civic 1,8i')}"
puts "Ср.расход бензина для авто заданного бренда : #{park_auto.consumption_by_brand('ВАЗ')}"
#puts park_auto.cars




