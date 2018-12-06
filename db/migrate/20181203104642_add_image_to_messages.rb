class AddImageToMessages < ActiveRecord::Migration[5.2]
  def change
    add_column :messages, :image, :text
  end
end
