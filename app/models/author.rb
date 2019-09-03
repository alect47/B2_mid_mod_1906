class Author < ApplicationRecord
  has_many :author_books
  has_many :books, through: :author_books
  validates_presence_of :name

  def average_pages
    books.average(:page_count)
  end

  def book_count
    books.count
  end

  def has_books?
    books.count > 0
  end
end
