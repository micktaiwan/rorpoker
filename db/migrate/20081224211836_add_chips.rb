class AddChips < ActiveRecord::Migration
  def self.up
    add_column :memberships, :chips, :integer, :default=>0, :null=>false
  end

  def self.down
    remove_column :memberships, :chips
  end
end
