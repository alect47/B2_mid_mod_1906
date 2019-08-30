class Book < ApplicationRecord
  has_many :author_books
  has_many :authors, through: :author_books
  validates_presence_of :title, :page_count, :publication_year
end
