require 'csv'
class BooksController < ApplicationController
  #before_action :authenticate_user!
  before_action :set_book, only: %i[ show edit update destroy ]

  # GET /books or /books.json
  def index
    #@books = Book.all
    @q = Book.ransack params[:q]
    @books = @q.result
    @book = Book.new
    @books = Book.all
  end

  # GET /books/1 or /books/1.json
  def show
    
  end

  # GET /books/new
  def new
    @book = Book.new
  end

  # GET /books/1/edit
  def edit
  end

  # POST /books or /books.json
  def create
    @book = Book.new(book_params)

    respond_to do |format|
      if @book.save
        format.html { redirect_to @book, notice: "Book was successfully created." }
        format.json { render :show, status: :created, location: @book }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /books/1 or /books/1.json
  def update
    respond_to do |format|
      if @book.update(book_params)
        format.html { redirect_to @book, notice: "Book was successfully updated." }
        format.json { render :show, status: :ok, location: @book }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end
	
  def upload
	csv_file = book_params[:csv_file]
	CSV.foreach(csv_file.tempfile, encoding: "#{ __ENCODING__}:UTF-8") do |row|
	Book.create(title: row[0], author: row[1])
	end
	redirect_to books_url

  end

  def download
	csv_data = CSV.generate do |csv|
		csv << ["タイトル", "著者"]
		Book.pluck(:title, :author).each do |book|
			csv << book
		end
	end
	send_data csv_data, type:'text/csv', filename:'books.csv'
  end




  # DELETE /books/1 or /books/1.json
  def destroy
    @book.destroy
    respond_to do |format|
      format.html { redirect_to books_url, notice: "Book was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def book_params
      params.require(:book).permit(:title, :author, :published_on, :showing, :price, :picture, :csv_file, tag_ids: [])
    end
end
