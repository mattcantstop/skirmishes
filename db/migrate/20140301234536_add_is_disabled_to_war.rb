class AddIsDisabledToWar < ActiveRecord::Migration
  def change
    add_column :wars, :is_disabled, :boolean, :default => false
  end
end
