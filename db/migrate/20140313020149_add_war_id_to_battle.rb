class AddWarIdToBattle < ActiveRecord::Migration
  def change
    add_column :battles, :war_id, :integer
  end
end
