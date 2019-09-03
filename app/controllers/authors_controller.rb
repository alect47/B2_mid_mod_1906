class AuthorsController < ApplicationController

  def show
    @author = Author.find(params[:id])
    @average_pages = @author.average_pages
    @has_books = @author.has_books?
  end

  def index
      @authors = Author.all
  end

  def new
  end

  def create
    @author = Author.create!(author_params)
    if @author.save
      redirect_to "/authors"
    end
  end

  private

  def author_params
    params.permit(:name)
  end

end
