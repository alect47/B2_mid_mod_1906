require 'rails_helper'

describe 'When user visits book index' do
  before(:each) do
    @stephen = Author.create(name: "Stephen King")
    @stand = Book.create(title: "The Stand", page_count: 740, publication_year: 1994 )
    @gunslinger = Book.create(title: "The Gunslinger", page_count: 840, publication_year: 1996 )

    @stephen.books << @stand
    @stephen.books << @gunslinger
  end

    it "they see all books in system and info" do
      visit "/books"

      expect(current_path).to eq('/books')

      within "#book-#{@stand.id}" do
        expect(page).to have_content("Title: #{@stand.title}")
        expect(page).to have_content("Page count: #{@stand.page_count}")
        expect(page).to have_content("Publication year: #{@stand.publication_year}")
        expect(page).to have_content("Author: #{@stand.authors.name}")
      end

      within "#book-#{@gunslinger.id}" do
        expect(page).to have_content("Title: #{@gunslinger.title}")
        expect(page).to have_content("Page count: #{@gunslinger.page_count}")
        expect(page).to have_content("Publication year: #{@gunslinger.publication_year}")
        expect(page).to have_content("Author: #{@gunslinger.authors.name}")
      end
    end
end
