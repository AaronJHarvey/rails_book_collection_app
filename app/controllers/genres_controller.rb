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
      redirect_to @genre ##THIS COULD BE @genre
      #if it the genre_params are valid it saves to the genre to db and redirects to the show page for that genre
    else
      render :new #if it the genre_params are not valid it renders the new view for the user try creating a genre
    end
  end

  def edit
    @genre = Genre.find(params[:id])#uses the inputted genre_id to look for a genre. If it finds one, sets the current genre(@genre) to the genre with that id
  end

  def update
    @genre = Genre.find_by_id(id: params[:id])
    @genre.update(genre_params)
      if @genre.save
        redirect_to @genre ##THIS COULD BE @genre
        #uses the inputted genre_id to look for a genre. If it finds one sets the current genre(@genre) to the genre with that id
      else
        renders :edit#allows the user to make changes to the params for the genre (genre_params)
      end
  end

  def destroy
    @genre = Genre.find(params[:id])#uses the genre_id that was input to set the working genre
    @genre.destroy
    #throws up a message letting the user know the genre was deleted
    redirect_to genres_path #redirects to the index view (genres_path)
  end



  private
    def genre_params
      params.require(:genre).permit(:name)
    end
end
