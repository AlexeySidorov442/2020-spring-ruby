class MyComplex

    attr_reader :real, :imaginary

    def initialize(real, imaginary)
        @real=Float(real)
        @imaginary=Float(imaginary)
    end

    def to_s
        "Number: #{@real} + i * #{@imaginary}"
    end

    def add(other)
        change_real=other.real+@real
        change_imaginary=other.imaginary+@imaginary
        MyComplex.new(change_real,change_imaginary)
    end

    def sub(other)
        change_real=other.real-@real
        change_imaginary=other.imaginary-@imaginary
        MyComplex.new(change_real,change_imaginary)
    end

    def multiply(other)
        change_real=other.real*@real+(other.imaginary*@imaginary)*(-1)
        change_imaginary=other.real*@imaginary+other.imaginary*@real
        MyComplex.new(change_real,change_imaginary)
    end

    def divide(other)
        change_real=(other.real*@real+other.imaginary*@imaginary)/(@real**2+@imaginary**2)
        change_imaginary=(@real*other.imaginary-other.real*@imaginary)/(@real**2+@imaginary**2)
        MyComplex.new(change_real,change_imaginary)
    end

end

