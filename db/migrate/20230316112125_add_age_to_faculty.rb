class AddAgeToFaculty < ActiveRecord::Migration[7.0]
  def change
    add_column :faculties, :age, :integer
    add_column :faculties, :counter, :integer
  end
end
