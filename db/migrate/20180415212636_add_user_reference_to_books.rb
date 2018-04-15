class AddUserReferenceToBooks < ActiveRecord::Migration[5.1]
  def change
    add_reference :books, :user, index: true
  end
end
