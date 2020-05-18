# frozen_string_literal: true

require 'forwardable'
require_relative 'triangle'

class TriangleList
  extend Forwardable
  def_delegator :@triangle_list, :each

  def initialize(triangle_list=[])
    @triangle_list = triangle_list
  end

  def add_triangle(triangle)
    @triangle_list.append(triangle)
  end

  def all_triangles
    @triangle_list.dup
  end

  def triangles_by_area(min, max)
    @triangle_list.select do |triangle|
      puts "area :#{triangle.area}"
      puts "triangle: #{triangle.size_a}  #{triangle.size_b}  #{triangle.size_c}"
      puts "min :#{min.to_f}"
      puts "max :#{max.to_f}"
      next if triangle.area > max.to_f
      next if triangle.area < min.to_f

      true
    end
end
end
