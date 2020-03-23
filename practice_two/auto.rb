class Auto
    
    attr_reader :brand, :model, :manifacture_year, :gasoline_consumption

    def initialize(brand, model, manifacture_year,gasoline_consumption)
        @brand=brand
        @model=model
        @manifacture_year=Integer(manifacture_year)
        @gasoline_consumption=Float(gasoline_consumption)
    end

    def to_s
        "\n\t Марка автомобиля: #{@brand}.
         Модель автомобиля: #{@model}. 
         Год выпуска: #{@manifacture_year}.
         Средний расход бензина на 100 километров: #{@gasoline_consumption}."
    end
end