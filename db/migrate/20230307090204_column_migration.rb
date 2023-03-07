class ColumnMigration < ActiveRecord::Migration[7.0]
  def up
    add_index :authors , :first_name
  end
  def down
    remove_index :authors, :first_name
  end 
end
