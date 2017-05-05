class AddEvensCountMembersCountToAdmins < ActiveRecord::Migration

  def self.up

    add_column :admins, :evens_count, :integer, :null => false, :default => 0

    add_column :admins, :members_count, :integer, :null => false, :default => 0
  end

  def self.down

    remove_column :admins, :evens_count

    remove_column :admins, :members_count

  end

end
