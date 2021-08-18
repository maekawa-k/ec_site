class Product < ApplicationRecord
    has_many :check_items
    has_many :books
end
