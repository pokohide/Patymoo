class AddActivateToAdmins < ActiveRecord::Migration[5.0]
  def self.up
    add_column :admins, :activation_state, :string, :default => nil
    add_column :admins, :activation_token, :string, :default => nil
    add_column :admins, :activation_token_expires_at, :datetime, :default => nil

    add_index :admins, :activation_token
  end

  def self.down
    remove_index :admins, :activation_token

    remove_column :admins, :activation_token_expires_at
    remove_column :admins, :activation_token
    remove_column :admins, :activation_state
  end
end
