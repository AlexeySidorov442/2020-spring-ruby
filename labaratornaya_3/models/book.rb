# frozen_string_literal: true

require 'forwardable'

# class for books
class BookList
  extend Forwardable
  def_delegator :@books, :each, :each_book

  def initialize(books = [])
    @books = books
  end

  def add_book(book)
    @books.append(book)
  end

  def sort_by_date
    @books.sort { |a, b| (a.date <=> b.date) * -1 }
  end

  def all_books
    @books.dup
  end
end
