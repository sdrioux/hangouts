class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.text :body, null: false

      t.timestamps
    end

    add_reference :messages, :sender, index: true
    add_foreign_key :messages, :users, column: :sender_id

    add_reference :messages, :receiver, index: true
    add_foreign_key :messages, :users, column: :receiver_id

    add_reference :messages, :hangout, index: true
    add_foreign_key :messages, :hangouts
  end
end
