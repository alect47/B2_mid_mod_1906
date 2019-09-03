class Book < ApplicationRecord
  has_many :author_books
  has_many :authors, through: :author_books
  validates_presence_of :title

  validates :page_count, numericality: { only_integer: true,
                                        greater_than_or_equal_to: 1}

  validates :publication_year, numericality: { only_integer: true}
end
