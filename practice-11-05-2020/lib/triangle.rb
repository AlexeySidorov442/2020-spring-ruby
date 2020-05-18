# frozen_string_literal: true

class Triangle
  def initialize(size_a, size_b, size_c)
    @size_a = size_a.to_f
    @size_b = size_b.to_f
    @size_c = size_c.to_f
  end

  attr_reader :size_a
  attr_reader :size_b
  attr_reader :size_c

  def triangle?
    if ((@size_a + @size_b) <= @size_c) || ((@size_a + @size_c) <= @size_b) || ((@size_c + @size_b) <= @size_a)
      false
    else true
    end
  end

  def area
    if triangle?
      perimetr = ((@size_a + @size_b + @size_c) / 2).to_f
      Math.sqrt(perimetr * (perimetr - @size_a) * (perimetr - @size_b) * (perimetr - @size_c))
    else 0
    end
  end
end
