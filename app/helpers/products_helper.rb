module ProductsHelper
    def current_favorite?(product, favorite)
        favorite.check_items.map{|i|i.product_id}.include?(product.id)
    end
    
end
