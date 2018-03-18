class RemoveRatings < ActiveRecord::Migration[5.1]
  def change
    drop_table :ratings do |t|
      t.integer :vote
      t.references :book, foreign_key: true

      t.timestamps
    end
  end
end
