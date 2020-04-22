class Student
    attr_reader :number_classes
    attr_reader :full_name
    attr_reader :points

    def initialize(number_classes,full_name,points)
        @number_classes = number_classes
        @full_name = full_name
        @points = points
    end

    def dvoechnik?
        array = self.points
        if array.scan(/1/).length < 21
            true
        else
            false
        end
    end



    def to_s
        "Класс:#{@number_classes},ФИО:#{@full_name},Баллы:#{points}"
    end
end