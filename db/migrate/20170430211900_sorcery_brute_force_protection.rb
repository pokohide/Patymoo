class SorceryBruteForceProtection < ActiveRecord::Migration[5.0]
  def change
    add_column :admins, :failed_logins_count, :integer, :default => 0
    add_column :admins, :lock_expires_at, :datetime, :default => nil
    add_column :admins, :unlock_token, :string, :default => nil

    add_index :admins, :unlock_token
  end
end
