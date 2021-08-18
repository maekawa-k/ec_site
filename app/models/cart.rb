class Cart < ApplicationRecord
    has_many :line_items, dependent: :destroy
    has_many :books, through: :line_items

    #商品を検索
    #カートに同じ本があればそのIDを取得し、同じ本がなければ新規作成の対象となる
    def add_book(book_id)
        line_items.find_or_initialize_by(book_id: book_id)
    end

    #カート全体の合計金額
    def total_price
        line_items.to_a.sum { |item| item.total_price }
    end

    #カート全体の商品数
    def total_number
        line_items.to_a.sum { |item| item.quantity }
    end

end
