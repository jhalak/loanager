class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string "first_name", :limit => 50
      t.string "last_name",  :limit => 50
      t.string "email", :default => "", :null => false
      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
