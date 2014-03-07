class RemoveColumnsForUsers < ActiveRecord::Migration
  def down
    remove_column :users, :reset_password_token, :reset_password_sent_at, :sign_in_count, :current_sign_in_at, :last_sign_in_ip
  end
end
