class Order < ApplicationRecord
  belongs_to :user
  belongs_to :book, optional: true
  has_many :order_details, dependent: :destroy
  has_many :line_items

  enum status: {resistered: 0, payed: 1, delivered: 2}
end
