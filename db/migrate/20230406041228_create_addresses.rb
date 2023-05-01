class CreateAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :addresses do |t|
      t.string :line1
      t.string :line2
      t.string :area
      t.string :city
      t.string :state

      t.timestamps
    end
  end
end
