class Order < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :status, :integer, default:0, null:false
  end
end
