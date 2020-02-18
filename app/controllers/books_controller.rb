class BooksController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_user, only: [:show, :edit, :update, :destroy]
  def index
      @books = current_user.books.order(id: :desc).page(params[:page])
  end

  def show
  end

  def new
      @book = Book.new
  end

  def create
    @book = current_user.books.build(book_params)
    if @book.save
      flash[:success] = '積読が正常に追加されました'
      redirect_to root_url
    else
      @books = current_user.feed_books.order(id: :desc).page(params[:page])
      flash.now[:danger] = '積読が追加されませんでした'
      render 'books/new'
    end
  end

  def edit
    
  end

  def update

    if @book.update(book_params)
      flash[:success] = '積読は正常に更新されました'
      redirect_to @book
    else
      flash.now[:danger] = '積読は更新されませんでした'
      render :edit
    end
  end

  def destroy
    @book.destroy
    flash[:success] = '積読は正常に削除されました'
    redirect_to root_url
  end
  
  private
  
  
  # Strong Parameter
  def book_params
    params.require(:book).permit(:status,:title,:buy_date)
  end
  def correct_user
    @book = current_user.books.find_by(id: params[:id])
    unless @book
      redirect_to root_url
    end
  end
  
end

