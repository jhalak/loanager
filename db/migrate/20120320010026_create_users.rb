class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string "first_name",  :limit => 50
      t.string "last_name",   :limit => 50
      t.string "username",    :limit => 50
      t.string "email",       :default => "", :null => false      
      t.string "hashed_password"
      t.string "salt"
      t.integer "active",     :default => 1
      t.timestamps
    end
    User.create(:first_name => "Admin", :last_name => "User", :username => "admin", :password => "admin", :email => "admin@example.com")
  end

  def self.down
    drop_table :users
  end
end