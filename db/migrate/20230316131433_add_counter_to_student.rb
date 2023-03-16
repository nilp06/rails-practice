class AddCounterToStudent < ActiveRecord::Migration[7.0]
  def change
    add_column :students, :counter, :integer
  end
end
