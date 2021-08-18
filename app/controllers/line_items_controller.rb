class LineItemsController < ApplicationController
  before_action :set_line_item, only: %i[ show edit update destroy ]

  # GET /line_items or /line_items.json
  #セッションごとのカートの商品を全件表示
  def index
    #@line_items = LineItem.all
    @line_items = LineItem.where(cart_id: @current_cart)
  end

  # GET /line_items/1 or /line_items/1.json
  def show
  end

  # GET /line_items/new
  def new
    @product = Book.find(params[:book_id].to_i)
    @line_item = LineItem.new
  end

  def confirm
    @product = Book.find(line_item_params[:book_id])
    @line_item = LineItem.new(line_item_params)
  end




  # GET /line_items/1/edit
  def edit
  end

  # POST /line_items or /line_items.json
  #カートに紐づく注文情報を登録する
  def create
    #セッション情報(カート情報の取得)
    cart = current_cart
    #注文された商品の情報を取得
    book = Book.where(id: params[:book_id])
    #add_bookで既にカートにあるものかどうかを判断する
    #@line_itemにカートIDとbookIDが渡る
    @line_item = cart.add_book(book)

    @line_item = LineItem.new(line_item_params)


        if @line_item.save
          flash[:notice] = "買い物かごに追加しました。"
          redirect_to products_index_path

    # @line_items = LineItem.all
    # @line_items.each do |line_item|
    #   if line_item.book_id == @line_item.book_id && current_cart
    #     new_quantity = line_item.quantity + @line_item.quantity
    #     line_item.update_attribute(:quantity, new_quantity)
    #     @line_item.delete
    #   end 
    # end
        else
          flash[:notice] = "買い物かごに追加できませんでした。"
          redirect_to products_index_path
        end
  end

  # PATCH/PUT /line_items/1 or /line_items/1.json
  def update
    respond_to do |format|
      if @line_item.update(line_item_params)
        format.html { redirect_to @line_item, notice: "Line item was successfully updated." }
        format.json { render :show, status: :ok, location: @line_item }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @line_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /line_items/1 or /line_items/1.json
  def destroy
    @line_item.destroy
    respond_to do |format|
      format.html { redirect_to line_items_url, notice: "カートから商品が削除されました" }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_line_item
      @line_item = LineItem.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def line_item_params
      params.require(:line_item).permit(:book_id, :cart_id, :quantity)
    end

end
