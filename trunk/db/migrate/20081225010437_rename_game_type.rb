class RenameGameType < ActiveRecord::Migration
  def self.up
    rename_column :games, :type, :game_type
  end

  def self.down
    rename_column :games, :game_type, :type
  end
end
