require 'rails_helper'

describe Author, type: :model do
  describe "validations" do
    it { should validate_presence_of :name}
  end

  describe "relationships" do
    it { should have_many(:books).through(:author_books)}
    it { should have_many(:author_books)}
  end

  describe "instance methods" do
    before(:each) do
      @stephen = Author.create(name: "Stephen King")
      @stand = Book.create(title: "The Stand", page_count: 740, publication_year: 1994 )
      @gunslinger = Book.create(title: "The Gunslinger", page_count: 840, publication_year: 1996 )

      @stephen.books << @stand
      @stephen.books << @gunslinger
    end

    it "can calculate average pages" do
      expect(@stephen.average_pages).to eq(790)
    end
  end
end
