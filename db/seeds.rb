# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Author.destroy_all
Book.destroy_all

stephen = Author.create(name: "Stephen King")
isabelle = Author.create(name: "Isabelle Allende")
stand = Book.create(title: "The Stand", page_count: 740, publication_year: 1994 )
gunslinger = Book.create(title: "The Gunslinger", page_count: 840, publication_year: 1996 )
house = Book.create(title: "House of spirits", page_count: 240, publication_year: 1992 )

stephen.books << stand
stephen.books << gunslinger
isabelle.books << house
