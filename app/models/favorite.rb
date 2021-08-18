class Favorite < ApplicationRecord
    #Favoritesの削除時は、favorite_idに紐づくcheck_itemsのデータも削除される
    has_many :check_items, dependent: :destroy

    #favoriteモデルにcheck_itemを登録するメソッド
    #商品が既にあれば取得、なければ新規でcheck_itemオブジェクトを生成し、check_itemオブジェクトを返す
    def add_product(product_id)
        check_items.find_or_initialize_by(product_id: product_id)
    end


end
