class CreateHangouts < ActiveRecord::Migration[5.2]
  def change
    create_table :hangouts do |t|
      t.timestamps
    end

    add_reference :messages, :user, index: true
    add_foreign_key :messages, :users, column: :sender_id

    add_reference :messages, :receiver, index: true
    add_foreign_key :messages, :users, column: :receiver_id
  end
end
