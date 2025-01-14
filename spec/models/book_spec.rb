require 'rails_helper'

describe Book, type: :model do
  describe "validations" do
    it { should validate_presence_of :title}
    it { should validate_numericality_of(:page_count) }
    it { should validate_numericality_of :publication_year}
  end

  describe "relationships" do
    it { should have_many(:authors).through(:author_books)}
    it { should have_many :author_books}
  end
end
