class BooksController < ApplicationController

  def index
    @books = Book.all
  end

  def new
    @author = Author.find(params[:author_id])
  end

  def create
    @author = Author.find(params[:author_id])
    book = @author.books.create(book_params)
    if book.save
      redirect_to "/authors/#{@author.id}"
    else
      flash[:error] = book.errors.full_messages
      redirect_to "/authors/#{@author.id}/books/new"
    end
  end

private

  def book_params
    params.permit(:title, :page_count, :publication_year)
  end

end
