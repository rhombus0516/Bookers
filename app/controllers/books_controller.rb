class BooksController < ApplicationController
  def new
     
  end

  def index 
    @book =Book.new
    @books = Book.all
  end
  
  def create
    book = Book.new(book_params)
    book.save
    redirect_to book_path(@books.id)
  end

  def show
    @books = Book.find(params[:id])
  end

  def edit
    @books = Book.find(params[:id])
  end
  
  def update
    @books = Book.find(params[:id])
    @book.update(book_params)
    redirect_to book_path(@books.id)
  end
  
  def destroy
    @books = Book.find(params[:id])
    Book.destroy
    redirect_to '/books'
  end  

  private
  def book_params
   params.require(:book).permit(:title, :body)
  end
    
end
