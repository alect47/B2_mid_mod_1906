require 'rails_helper'

describe AuthorBook, type: :model do
  describe "validations" do
    it { should validate_presence_of :author_id}
    it { should validate_presence_of :book_id }
  end

  describe "relationships" do
    it { should belong_to :author}
    it { should belong_to :book}
  end
end
