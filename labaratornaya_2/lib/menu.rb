# frozen_string_literal: true

require 'tty-prompt'
require_relative 'student'
require_relative 'student_list'

# Classes for print menu and move
class Menu
  def initialize
    @prompt = TTY::Prompt.new
    @student_list = StudentList.new
  end

  MAIN_MENU_CHOICES = [
    { name: 'Вывести двоечников с указанием ФИО, класса, кол-ва правильных ответов',
     value: :dvoechniki },
    { name: 'Вычислять статистику тестирования', value: :statistic },
    { name: 'Пересчитать оценки по другой шкале', value: :newschet },
    { name: 'Проверить на возможное списывание', value: :spisal },
    { name: 'Найти три самых сложных вопроса', value: :hardquestion },
    { name: 'Завершить работу', value: :exit }
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
        print student.full_name + ', ' + student.number_classes + 
        ' Правильных ответов:' + student.points.scan(/1/).length.to_s
        print "\n"
      end
    end
  end

  def show_statistic
    student_in_class_a = 0
    ball_in_class_a = 0
    student_in_class_b = 0
    ball_in_class_b = 0
    student_in_class_v = 0
    ball_in_class_v = 0
    student_in_class_g = 0
    ball_in_class_g = 0
    student_in_class_d = 0
    ball_in_class_d = 0
    @student_list.each_student do |student|
      if student.number_classes == '7А'
        student_in_class_a += 1
        ball_in_class_a += student.points.scan(/1/).length.to_i
      end
      if student.number_classes == '7Б'
        student_in_class_b += 1
        ball_in_class_b += student.points.scan(/1/).length.to_i
      end
      if student.number_classes == '7В'
        student_in_class_v += 1
        ball_in_class_v += student.points.scan(/1/).length.to_i
      end
      if student.number_classes == '7Г'
        student_in_class_g += 1
        ball_in_class_g += student.points.scan(/1/).length.to_i
      end
      if student.number_classes == '7Д'
        student_in_class_d += 1
        ball_in_class_d += student.points.scan(/1/).length.to_i
      end
    end

    print "Количество учеников в классах:\n"
    print "7A - #{student_in_class_a}, Баллов в классе : #{ball_in_class_a}
     Средний балл:#{ball_in_class_a / student_in_class_a}\n"
    print "7Б - #{student_in_class_b}, Баллов в классе : #{ball_in_class_b}
     Средний балл:#{ball_in_class_b / student_in_class_b}\n"
    print "7В - #{student_in_class_v}, Баллов в классе : #{ball_in_class_v}
     Средний балл:#{ball_in_class_v / student_in_class_v}\n"
    print "7Г - #{student_in_class_g}, Баллов в классе : #{ball_in_class_g}
     Средний балл:#{ball_in_class_g / student_in_class_g}\n"
    print "7Д - #{student_in_class_d}, Баллов в классе : #{ball_in_class_d}
     Средний балл:#{ball_in_class_d / student_in_class_d}\n"
  end
end
