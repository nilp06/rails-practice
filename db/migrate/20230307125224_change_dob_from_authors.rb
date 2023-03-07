class ChangeDobFromAuthors < ActiveRecord::Migration[7.0]
  def change
    reversible do |dir|
      dir.up do
        rename_column :authors, :dob, :date_of_birth
      end
      dir.down do
        rename_column :authors, :date_of_birth, :dob
      end
    end
  end
end
