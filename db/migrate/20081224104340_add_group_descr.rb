class AddGroupDescr < ActiveRecord::Migration
  def self.up
    add_column :groups, :descr, :text
    add_column :games,  :descr, :text    
  end

  def self.down
    remove_column :groups, :descr
    remove_column :games,  :descr
  end
end
