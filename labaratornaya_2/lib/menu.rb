require 'tty-prompt'
require_relative 'student'
require_relative 'student_list'

class Menu

    def initialize
        @prompt = TTY::Prompt.new
        @student_list = StudentList.new
    end

    MAIN_MENU_CHOICES = [
        { name: 'Вывести двоечников с указанием ФИО, класса, кол-ва правильных ответов', value: :dvoechniki },
        { name: 'Вычислять статистику тестирования', value: :statistic },
        { name: 'Пересчитать оценки по другой шкале', value: :newschet },
        { name: 'Проверить на возможное списывание', value: :spisal},
        { name: 'Найти три самых сложных вопроса', value: :hardquestion},
        { name: 'Завершить работу', value: :exit}
      ].freeze

      def show_menu
        loop do
          action = @prompt.select('Выберите действие', MAIN_MENU_CHOICES)
          break if action == :exit
            
          show_dvoechnik if action == :dvoechniki
          show_statistic if action == :statistic
          end
        end
      

      def show_dvoechnik
        print "Список двоечников:\n"
        @student_list.each_student do |student|
            if student.dvoechnik?
                print student.full_name+", "+student.number_classes+" Правильных ответов:"+student.points.scan(/1/).length.to_s
                print "\n"
            end
        end
      end

      def show_statistic
        a=0
        avgA=0
        b=0
        avgB=0
        v=0
        avgV=0
        g=0
        avgG=0
        d=0
        avgD=0
        @student_list.each_student do |student|
             if student.number_classes == '7А'
                a=a+1
                avgA =avgA + student.points.scan(/1/).length.to_i
             end
            if student.number_classes == '7Б'
                b=b+1
                avgB =avgB + student.points.scan(/1/).length.to_i
            end
             if student.number_classes == '7В'
                v=v+1
                avgV =avgV + student.points.scan(/1/).length.to_i
             end
             if student.number_classes == '7Г'
                g=g+1
                avgG =avgG + student.points.scan(/1/).length.to_i
             end
            if student.number_classes == '7Д'
                d=d+1
                avgD =avgD + student.points.scan(/1/).length.to_i
            end
        end
       
        print "Количество учеников в классах:\n"
        print "7A - #{a}, Баллов в классе : #{avgA}, Средний балл:#{avgA/a}\n"
        print "7Б - #{b}, Баллов в классе : #{avgB}, Средний балл:#{avgB/b}\n"
        print "7В - #{v}, Баллов в классе : #{avgV}, Средний балл:#{avgV/v}\n"
        print "7Г - #{g}, Баллов в классе : #{avgG}, Средний балл:#{avgG/g}\n"
        print "7Д - #{d}, Баллов в классе : #{avgD}, Средний балл:#{avgD/d}\n"
      end
end