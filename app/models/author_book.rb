class AuthorBook < ApplicationRecord
  belongs_to :author
  belongs_to :book

  validates_presence_of :author_id
  validates_presence_of :book_id
end
