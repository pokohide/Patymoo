class AddRemembermeToAdmins < ActiveRecord::Migration[5.0]
  def self.up
    add_column :admins, :remember_me_token, :string, :default => nil
    add_column :admins, :remember_me_token_expires_at, :datetime, :default => nil

    add_index :admins, :remember_me_token
  end

  def self.down
    remove_index :admins, :remember_me_token

    remove_column :admins, :remember_me_token_expires_at
    remove_column :admins, :remember_me_token
  end
end
