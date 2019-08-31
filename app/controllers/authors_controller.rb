class AuthorsController < ApplicationController

  def show
    @author = Author.find(params[:author_id])
    @average_pages = @author.average_pages
  end

end
