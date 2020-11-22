class AddIsPrivateToBook < ActiveRecord::Migration[6.0]
  def change
    add_column :books, :is_private, :boolean
  end
end
