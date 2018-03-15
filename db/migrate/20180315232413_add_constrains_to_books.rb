class AddConstrainsToBooks < ActiveRecord::Migration[5.1]
  def change
    change_column_null(:books, :title, false)
    change_column_null(:books, :author, false)
    change_column_null(:books, :description, false)
    change_column_null(:books, :publishing_house, false)
  end
end
