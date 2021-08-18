class CreateCheckItems < ActiveRecord::Migration[5.2]
  def change
    create_table :check_items do |t|
      t.references :book, foreign_key: true
      t.references :favorite, foreign_key: true

      t.timestamps
    end
  end
end
