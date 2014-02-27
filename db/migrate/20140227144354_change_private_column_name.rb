class ChangePrivateColumnName < ActiveRecord::Migration
  def change
    rename_column :wars, :private, :is_private
  end
end
