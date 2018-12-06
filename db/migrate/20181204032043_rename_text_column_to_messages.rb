class RenameTextColumnToMessages < ActiveRecord::Migration[5.2]
  def change
    rename_column :messages, :text, :message
  end
end
