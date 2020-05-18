# frozen_string_literal: true

# check input data
module InputValidators
  def self.date_valid?(date)
    format = '%Y-%m-%d'
    Date.strptime(date, format)
    true
  rescue ArgumentError
    false
  end

  

  def self.check_year_format(date)
    if /\d{4}/ =~ date
      []
    else
      ['Дата должна быть передана в формате ГГГГ']
    end
  end

  def self.check_year_empty(date)
    if date.empty?
      ['Дата не может быть пустой']
    else
      []
    end
  end

  def self.check_year(raw_date)
    date = raw_date || ''
    errors = [].concat(check_year_format(date))
               .concat(check_year_empty(date))
    {
      date: date,
      errors: errors
    }
  end

  def self.check_date_format(date)
    if date_valid?(date)
      []
    else
      ['Ошибка во 2 строке -> Дата должна быть передана в формате ГГГГ-ММ-ДД и являться реальной (месяц<=12 , день <=31)']
    end
  end

  def self.check_book(raw_name, raw_date, raw_description)
    name = raw_name || ''
    date = raw_date || ''
    description = raw_description || ''
    errors = [].concat(check_name(name))
               .concat(check_date(date))
               .concat(check_date_format(date))
               .concat(check_description(description))
               
    {
      name: name,
      date: date,
      description: description,
      errors: errors
    }
  end

  def self.check_name(name)
    if name.empty?
      ['Ошибка в 1 строке -> Имя автора не может быть пустым!']
    else
      []
    end
  end

  def self.check_description(description)
    if description.empty?
      ['Ошибка в 3 строке -> Название произведения не может быть пустым!']
    else
      []
    end
  end

  def self.check_date(date)
    if date.empty?
      ['Ошибка во 2 строке -> Дата не может быть пустой!']
    else
      []
    end
  end
end
