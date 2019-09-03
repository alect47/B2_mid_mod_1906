require 'rails_helper'

describe 'When user visits book index' do
  before(:each) do
    @stephen = Author.create(name: "Stephen King")
    @steve = Author.create(name: "Stephen Caesar")
    @stand = Book.create(title: "The Stand", page_count: 740, publication_year: 1994 )
    @gunslinger = Book.create(title: "The Gunslinger", page_count: 840, publication_year: 1996 )

    @stephen.books << @stand
    @stephen.books << @gunslinger
    @steve.books << @gunslinger
  end

  it "they can add a new author" do
    visit "/authors"
    expect(page).to have_content(@steve.name)
    expect(page).to have_content(@stephen.name)
    expect(page).to have_content(@stephen.book_count)
    expect(page).to have_content(@steve.book_count)
    expect(page).to have_link("New Author")
    click_link("New Author")
    expect(current_path).to eq("/authors/new")

    name = "Isabelle"

    fill_in :name, with: name
    click_button "Create Author"

    expect(current_path).to eq("/authors")

    expect(page).to have_content(name)
    end
  end
