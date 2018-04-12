class AddConstrainsToReviews < ActiveRecord::Migration[5.1]
  def change
    change_column_null(:reviews, :name, false)
    change_column_null(:reviews, :contents, false)
  end
end
