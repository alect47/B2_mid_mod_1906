class AddAuthorsToBooks < ActiveRecord::Migration[5.1]
  def change
    add_reference :books, :authors, foreign_key: true

  end
end
