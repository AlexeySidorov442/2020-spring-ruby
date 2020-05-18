# frozen_string_literal: true

require 'roda'
require_relative 'models'

# The Main class
class BookApp < Roda
  opts[:root] = __dir__
  plugin :environments
  plugin :render

  configure :development do
    plugin :public
    opts[:serve_static] = true
  end

  opts[:books] = BookList.new([
                                Book.new('Михаил Булгаков', '2020-01-15', 'Мастер и Маргарита'),
                                Book.new('Николай Гоголь', '2019-06-09', 'Мертвые души'),
                                Book.new('Лев Толстой', '2018-11-20', 'Война и мир')
                              ])

  route do |r|
    r.public if opts[:serve_static]

    r.root do
      'Specify in the site path /books to display the main information'
    end

    r.on 'books' do
      r.is do
        @params = InputValidators.check_year(r.params['date'])

        if @params[:errors].empty?
          @filtered_books = opts[:books].sort_by_date.select { |book| book.date.split('-').map(&:to_i).first == @params[:date].to_i }

        else
          @filtered_books = opts[:books].sort_by_date
        end
        view('books')
      end

      r.on 'new' do
        r.get do
          view('new_book')
        end

        r.post do
          @params = InputValidators.check_book(r.params['name'], r.params['date'], r.params['description'])
          if @params[:errors].empty?
            opts[:books].add_book(Book.new(@params[:name], @params[:date], @params[:description]))
            r.redirect '/books'
          else
            view('new_book')
          end
        end
      end
    end
  end
end
