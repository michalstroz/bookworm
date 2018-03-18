class AddRatingToBooks < ActiveRecord::Migration[5.1]
  def change
    add_column :books, :rate, :float, default: 0.0, null: false
    add_column :books, :votes_quantity, :integer, default: 0, null: false
  end
end
