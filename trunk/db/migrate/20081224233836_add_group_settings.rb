class AddGroupSettings < ActiveRecord::Migration
  def self.up
    add_column :groups, :settings, :string
  end

  def self.down
    remove_column :groups, :settings
  end
end
