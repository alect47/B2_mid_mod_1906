require 'rails_helper'

describe 'When user visits author show page' do
  before(:each) do
    @stephen = Author.create(name: "Stephen King")
    @stand = Book.create(title: "The Stand", page_count: 740, publication_year: 1994 )
    @gunslinger = Book.create(title: "The Gunslinger", page_count: 840, publication_year: 1996 )

    @stephen.books << @stand
    @stephen.books << @gunslinger
  end

  it 'Shows user the authors information' do
    visit '/books'

    within "#book-#{@stand.id}" do
      expect(page).to have_link(@stephen.name)
      click_link(@stephen.name)
    end

    # save_and_open_page
    expect(current_path).to eq("/authors/#{@stephen.id}")
    expect(page).to have_content(@stephen.name)
    expect(page).to have_content(@stand.title, @gunslinger.title)
    expect(page).to have_content("Average pages: 790.0")
  end
end
