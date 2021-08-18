class LineItem < ApplicationRecord
  belongs_to :book
  belongs_to :cart

  #商品ごとの合計金額を出す
  def total_price
    book.price * quantity
  end
  
end
