# frozen_string_literal: true

require 'csv'
require_relative 'student'

# Classes for all student
class StudentList
  attr_reader :students
  def initialize
    @students = []

    data_load
  end

  def data_load
    data = CSV.parse(File.read(__dir__ + '/../data/test_results.csv'))
    data.each do |row|
      @students.push(Student.new(row[0], row[1], row[2]))
    end
  end

  def each_student
    @students.each do |student|
      yield student
    end
  end
end
