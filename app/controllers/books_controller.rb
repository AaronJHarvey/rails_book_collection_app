class BooksController < ApplicationController
before_action :redirect_if_not_logged_in

  def index
    if params[:genre_id]
      @books = current_user_books.where(genre_id: params[:genre_id])
    else
      @books = current_user_books
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
    @book = Book.find(params[:id])
    #uses the inputted book_id to look for a book. If it finds one, sets the current book(@book) to the book with that id
  end

  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    if @book.save
      redirect_to book_path(@book)
    else
      render :edit
    end
    #uses the inputted book_id to look for a book. If it finds one sets the current book(book) to the book with that id
    #allows the user to make changes to the params for the book(book_params)
  end

  def destroy
    @book = Book.find(params[:id])
    @book.delete
    redirect_to books_path
    #uses the book_id that was input to set the working book
    #@book.destroy
    #throws up a message letting the user know the book was deleted
    #redirects to the index view (books_path)
  end

  def read
   #@books = Book.read.where(user_id: @current_user.id)
   @books = current_user.books.read
    render :index
  end

  def unread
    @books = Book.unread.where(user_id: @current_user.id)
    render :index
  end

  private
    def book_params
      params.require(:book).permit(
        :title,
        :author,
        :user_id,
        :genre_id,
        :read
      )
    end
end
