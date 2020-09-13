class BooksController < ApplicationController
  def index
    if params[:genre_id]
      @books = Genre.find(params[:genre_id]).books
    else
      @books = Book.all
    end
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new(genre_id: params[:genre_id])
  end

  def create
    @book = Book.create(book_params)
    if @book.save
      redirect_to books_path
    else
      render :new
    #uses the book_params put into the form at new.html.erb
    #if the book_params are valid it saves to the book to db and redirects to the show page for that book
    #if it the book_params are not valid it renders the new view for the user try creating a book
    end
  end

  def edit
    @book = Book.find_by_id(id: params[:id])
    #uses the inputted book_id to look for a book. If it finds one, sets the current book(@book) to the book with that id
  end

  def update
    book = Book.find_by_id(id: params[:id])
    book.update(book_params)
    if book.save
      redirect_to book_path(book)
    else
      render :edit
    end
    #uses the inputted book_id to look for a book. If it finds one sets the current book(book) to the book with that id
    #allows the user to make changes to the params for the book(book_params)
  end

  def destroy
    @book = book.find_by_id(id: params[:id])
    @book.delete
    redirect_to books_path
    #uses the book_id that was input to set the working book
    #@book.destroy
    #throws up a message letting the user know the book was deleted
    #redirects to the index view (books_path)
  end

  private
    def book_params
      params.require(:book).permit(
        :title,
        :author,
        :user_id,
        :genre_id
      )
    end
end
