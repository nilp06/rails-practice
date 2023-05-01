class CreateProfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :profiles do |t|
      t.string :name
      t.string :email
      t.text :bio
      t.date :dob

      t.timestamps
    end
  end
end
