class AddPictureToBook < ActiveRecord::Migration[5.2]
  def change
    add_attachment :books, :picture
  end
end
