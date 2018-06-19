class CreateJoinTableUserHangout < ActiveRecord::Migration[5.2]
  def change
    create_join_table :users, :hangouts do |t|
      t.index [:user_id, :hangout_id]
    end
  end
end
