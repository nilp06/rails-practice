class CreateJoinTableUserEvent < ActiveRecord::Migration[7.0]
  def change
    create_join_table :users, :events
  end
end
