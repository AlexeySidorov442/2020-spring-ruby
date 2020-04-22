require 'csv'
require_relative 'student'

class StudentList
    attr_reader :students
    def initialize
        @students = []

        self.data_load
    end

    def data_load
        data = CSV.parse(File.read(__dir__+"/../data/test_results.csv"));
        data.each do |row|
            @students.push(Student.new(row[0],row[1],row[2]));
        end
    end

    def each_student
        @students.each do |student|
          yield student
        end
    end
    
end