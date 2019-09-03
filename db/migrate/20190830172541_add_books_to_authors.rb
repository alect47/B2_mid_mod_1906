class AddBooksToAuthors < ActiveRecord::Migration[5.1]
  def change
    add_reference :authors, :books, foreign_key: true
    
  end
end
