class AddGameName < ActiveRecord::Migration
  def self.up
    add_column :games, :name, :string, :default=>'No name'
  end

  def self.down
    remove_column :games, :name
  end
end
