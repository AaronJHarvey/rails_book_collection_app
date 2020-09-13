class GenresController < ApplicationController
  def index
    @genres = Genre.all
  end

  def new
    @genre = Genre.new
  end

  def create
    @genre = Genre.new(genre_params)#uses the genre_params put into the form at new.html.erb
    if @genre.save
      redirect_to genres_path ##THIS COULD BE @genre
      #if it the genre_params are valid it saves to the genre to db and redirects to the show page for that genre
    else
      render :new #if it the genre_params are not valid it renders the new view for the user try creating a genre
    end
  end



  private
    def genre_params
      params.require(:genre).permit(:name)
    end
end
