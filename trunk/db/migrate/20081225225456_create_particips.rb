class CreateParticips < ActiveRecord::Migration
  def self.up
    create_table :particips do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :particips
  end
end
