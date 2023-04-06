class AddCategoryReferenceToEvent < ActiveRecord::Migration[7.0]
  def change
    add_reference :events, :category, null: true, foreign_key: true
  end
end
