class ApplicationController < ActionController::Base

    protect_from_forgery with: :exception
    #ページを表示する前にログイン認証をかける
    before_action :authenticate_user!
    before_action :tags, :current_cart, :set_search_q
    
    def after_sign_in_path_for(resource) 
        products_index_path
    end

    def after_sign_out_path_for(_resource)
        new_user_session_path
    end

    def tags
        @tags = Tag.all
    end
    
    def set_search_q
        @q = Book.ransack params[:q]
    end

    private

    #現在のfavoriteを取得する機能
    #ef current_favorite
        #セッションにお気に入り情報(お気に入りID)を入れる
        #Favorite.find_by(id: session[:favorite_id])は、
        #Favoriteテーブルから現在のsessionのfavorite_idのものを取得しfavoriteという変数に入れる
        #favorite = Favorite.find_by(id: session[:favorite_id])
        
        #お気に入りにまだ登録されていなかったら、そのお気に入りIDを登録する
        #favorite = Favorite.create unless favorite
        #それをまたセッションに登録する
        #session[:favorite_id] = favorite.id
    #end

    #セッション登録機能
    def current_cart
        #カートに商品を入れる
        @current_cart = Cart.find_by(id: session[:cart_id])
        #まだカートに入っていなかったら、そのカートIDを登録する
        @current_cart = Cart.create unless @current_cart
        #セッションに登録する
        session[:cart_id] = @current_cart.id
        @current_cart
    end

end
