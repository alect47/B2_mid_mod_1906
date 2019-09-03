require 'rails_helper'

describe 'When user visits author index' do
  before(:each) do
    @stephen = Author.create(name: "Stephen King")
    @steve = Author.create(name: "Stephen Caesar")
    @stand = Book.create(title: "The Stand", page_count: 740, publication_year: 1994 )
    @gunslinger = Book.create(title: "The Gunslinger", page_count: 840, publication_year: 1996 )

    @stephen.books << @stand
    @stephen.books << @gunslinger
    @steve.books << @gunslinger
  end

  it "they can add a new book" do
    visit "/authors/#{@stephen.id}"
    expect(page).to have_link("New Book")
    click_link("New Book")
    expect(current_path).to eq("/authors/#{@stephen.id}/books/new")

    title = "Wizard and Glass"
    page_count = 720
    publication_year = 2001

    fill_in :title, with: title
    fill_in :page_count, with: page_count
    fill_in :publication_year, with: publication_year
    click_button "Create Book"

    new_book = Book.last
    expect(current_path).to eq("/authors/#{@stephen.id}")

    expect(new_book.title).to eq(title)
    expect(new_book.page_count).to eq(page_count)
    expect(new_book.publication_year).to eq(publication_year)
    end
  end
