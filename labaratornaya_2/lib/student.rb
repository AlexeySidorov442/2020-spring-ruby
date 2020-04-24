# frozen_string_literal: true

# Descript student person
class Student
  attr_reader :number_classes
  attr_reader :full_name
  attr_reader :points

  def initialize(number_classes, full_name, points)
    @number_classes = number_classes
    @full_name = full_name
    @points = points
  end

  def dvoechnik?
    array = points
    array.scan(/1/).length < 21
  end

  def to_s
    "Класс:#{@number_classes},ФИО:#{@full_name},Баллы:#{points}"
  end
end
