class CreateBattles < ActiveRecord::Migration
  def change
    create_table :battles do |t|
      t.integer :winner_id
      t.integer :user_id
      t.string :notes

      t.timestamps
    end
  end
end
