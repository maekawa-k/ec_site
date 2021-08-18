class CheckItem < ApplicationRecord
  belongs_to :book
  belongs_to :favorite
end
