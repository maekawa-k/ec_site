class ProductsController < ApplicationController

  before_action :authenticate_user!

  #indexアクション(商品であるBookの一覧)
  def index
    @q = Book.ransack params[:q]
    @products = @q.result
    #@products = Book.all
  end

  #showアクション(Book1冊の詳細)
  def show
    @product = Book.find(params[:id])
  end

end
