class AddOwnerNameToEvents < ActiveRecord::Migration[7.0]
  def change
    add_column :events, :owner_name, :string
  end
end
