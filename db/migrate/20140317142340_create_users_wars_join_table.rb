class CreateUsersWarsJoinTable < ActiveRecord::Migration
  def change
    create_join_table :users, :wars, :id => false do |t|
      # t.index [:user_id, :war_id]
      # t.index [:war_id, :user_id]
    end
  end
end
