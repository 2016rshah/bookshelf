class BooksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_book, only: [:edit, :update, :destroy] #only gets users books

  # GET /books
  # GET /books.json
  def index
    redirect_to root_path
  end

  # GET /books/1
  # GET /books/1.json
  def show
    @book = Book.find(params[:id]) #you can see any book, you just can't edit and stuff

  end

  # GET /books/new
  def new
    @book = Book.new
  end

  # GET /books/1/edit
  def edit
  end

  # POST /books
  # POST /books.json
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id

    #Get the book isbn from Open Library
    client = Openlibrary::Client.new
    results = client.search({author: @book.author, title: @book.title})
    best_match = results[0]
    if best_match
      puts best_match.isbn[0]
      @book.isbn = best_match.isbn[0]
      puts @book.isbn
    end

    respond_to do |format|
      if @book.save
        format.html { redirect_to @book, notice: 'Book was successfully created.' }
        format.json { render :show, status: :created, location: @book }

      else
        format.html { render :new }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /books/1
  # PATCH/PUT /books/1.json
  def update
    respond_to do |format|
      if @book.update(book_params)
        format.html { redirect_to @book, notice: 'Book was successfully updated.' }
        format.json { render :show, status: :ok, location: @book }
      else
        format.html { render :edit }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /books/1
  # DELETE /books/1.json
  def destroy
    @book.destroy
    respond_to do |format|
      format.html { redirect_to books_url, notice: 'Book was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      #@book = current_user.books.find(params[:id])
      #@book = Book.find(params[:id])
      @book = Book.find(params[:id])
      restrict_access if @book.user_id != current_user.id
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def book_params
      params.require(:book).permit(:title, :author, :user_id, :isbn, :notes)
    end

    def restrict_access
      redirect_to root_path, :alert => "Access denied"
    end
end
