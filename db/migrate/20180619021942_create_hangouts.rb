class CreateHangouts < ActiveRecord::Migration[5.2]
  def change
    create_table :hangouts do |t|
      t.timestamps
      t.references(:first_user, index: true)
      t.references(:second_user, index: true)
    end
  end
end
