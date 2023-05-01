class Changepassword < ActiveRecord::Migration[7.0]
  def change
    rename_column :users, :passowrd, :password_digest
  end
end
