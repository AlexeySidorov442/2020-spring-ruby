# frozen_string_literal: true

module InputValidators
  def self.check_min_and_max(raw_min, raw_max)
    min = raw_min || ''
    max = raw_max || ''
    error = []

    if min.empty? error.append('Поле min не может быть пустым')
    else error.concat(check_min_format(min))
    end
    if max.empty? error.append('Поле max не может быть пустым')
    else error.concat(check_max_format(max))
    end
    error.append('Поле min не должно превышать max') if min.to_f > max.to_f

    {
      min: min,
      max: max,
      error: error
    }
  end

  def self.check_min_format(min)
    if /\d/ =~min
      []
    else
      ['Формат минимума - одно число']
    end
  end

  def self.check_max_format(max)
    if /\d/ =~max
      []
    else
      ['Формат максимума - одно число']
    end
  end

  def self.check_side_lengths(raw_side_one, raw_side_two, raw_side_three)
    size_a = raw_side_one || ''
    size_b = raw_side_two || ''
    size_c = raw_side_three || ''
    error = [].concat(check_one_format(size_a))
              .concat(check_two_format(size_b))
              .concat(check_three_format(size_c))
    {
      size_a: size_a,
      size_b: size_b,
      size_c: size_c,
      error: error
    }
  end

  def self.check_one_format(one)
    if one.empty?
      ['Сторона не может быть пустой, введите значение']
    else
      []
    end
    if /\d/ =~ one
      []
    else
      ['Поле с первой стороной треугольника должна быть числом']
    end
  end

  def self.check_two_format(two)
    if two.empty?
      ['Сторона не может быть пустой, введите значение']
    else
      []
    end
    if /\d/ =~ two
      []
    else
      ['Поле с второй стороной треугольника должна быть числом']
    end
  end

  def self.check_three_format(three)
    if three.empty?
      ['Сторона не может быть пустой, введите значение']
    else
      []
    end
    if /\d/ =~ three
      []
    else
      ['Поле с третьей стороной треугольника должна быть числом']
    end
  end
end
