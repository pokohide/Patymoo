class AddMembersCountToEvents < ActiveRecord::Migration

  def self.up

    add_column :events, :members_count, :integer, :null => false, :default => 0

    add_column :members, :events_count, :integer, :null => false, :default => 0

  end

  def self.down

    remove_column :events, :members_count

    remove_column :members, :events_count
  end

end
