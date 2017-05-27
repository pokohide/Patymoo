class AddEventMembersCountToMembers < ActiveRecord::Migration

  def self.up
    add_column :members, :event_members_count, :integer, :null => false, :default => 0
    add_column :events, :event_members_count, :integer, :null => false, :default => 0
  end

  def self.down
    remove_column :members, :event_members_count
    remove_column :events, :event_members_count
  end
end
