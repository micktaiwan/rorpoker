class AddGameType < ActiveRecord::Migration
  def self.up
    add_column :games, :type, :string, :default=>'cash', :null=>false
  end

  def self.down
    remove_column :games, :type
  end
end
