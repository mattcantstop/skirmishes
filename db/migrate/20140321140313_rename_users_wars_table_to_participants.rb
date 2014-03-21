class RenameUsersWarsTableToParticipants < ActiveRecord::Migration
  def change
    rename_table :users_wars, :participants
  end
end
