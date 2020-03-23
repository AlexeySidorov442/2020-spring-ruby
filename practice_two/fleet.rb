class Fleet
    require 'json'
    attr_reader:cars   

    def initialize
        @cars=[]
    end

    def add(car)
        @cars.push(car)
    end

    def load_from_file(json_file_name)
        json_data = File.read(json_file_name)
        ruby_objects = JSON.parse(json_data)
        index=0
        while(ruby_objects.size!=index) do
        add(Auto.new(ruby_objects[index]['mark'],ruby_objects[index]['model'],ruby_objects[index]['year'],ruby_objects[index]['consumption']))
            index = index + 1
        end
    end

    def average_consumption
        index=0
        avg_cons=0
        while(@cars.size!=index) do
            avg_cons = avg_cons + @cars[index].gasoline_consumption
            index = index + 1
        end
        avg_cons = avg_cons / @cars.size
    end

    def number_by_brand(brand)
        index = 0
        number = 0
        while(@cars.size!=index) do
            if @cars[index].brand == brand 
                number = number + 1
            end
            index = index + 1
        end
        number
    end

    def number_by_model(model)
        index = 0
        number = 0
        while(@cars.size!=index) do
            if @cars[index].model == model 
                number = number + 1
            end
            index = index + 1
        end
        number
    end

    def consumption_by_brand(brand)
        index = 0 #Переменная для индекса массива
        avg = 0   #Переменная для подсчета среднего значения,определенного бренда
        value = 0 #Переменная считающая количество машин нужного бренда
        while(@cars.size!=index)do
            if @cars[index].brand == brand  #Если у объекта совпал бренд с заданным, то входим
                avg = avg + @cars[index].gasoline_consumption #К ср.значению прибавляем значение нужного поля
                value = value + 1  #Количество машин бренда, который нам требуется
            end
            index = index +1 #Индекс увеличиваем, для следующего элемента
        end
        avg = avg  / value #Полученное ср.значение делим на количество авто(заданного бренда)
    end

end