class JoinBookAuthor < ActiveRecord::Migration[7.0]
  def change
    create_join_table :books, :authors
  end
end
