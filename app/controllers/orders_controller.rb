class OrdersController < ApplicationController
  #layout 'front'
  before_action :authenticate_user!, only:["index", "show", "detail"]
  before_action :set_line_items

  def new
    #@product = Book.find(params[:book_id].to_i)
    #@cart = Cart.find(params[:cart_id].to_i)
    @line_items = LineItem.where(cart_id: params[:id])
    @order = Order.new
  end

  def confirm
    # @cart = Cart.where(cart_id: @current_cart)
    @line_items = LineItem.where(cart_id: params[:id])
    @order = Order.new(order_params)
  end

  def create
    unless user_signed_in?
      redirect_to cart_path(@current_cart), notice: 'ログインしてください'
      return
    end

    @order = Order.new(order_params)
    if @order.save
      OrderDetail.create_items(@order, @line_items)
      OrderMailer.confirm_mail(@order).deliver
      flash[:notice] = "注文が完了しました。"
      redirect_to products_index_path
    else
      flash[:notice] = "注文が完了しませんでした。"
      redirect_to products_index_path
    end
  end

  def index 
    @orders = Order.order("created_at DESC")
  end

  def show 
    @order = Order.find(params[:id])
  end


  private

  def set_line_items
    @line_items = @current_cart.line_items
  end


  def order_params
    params.require(:order).permit(:address, :quantity, :user_id, :book_id)
  end

  

end
