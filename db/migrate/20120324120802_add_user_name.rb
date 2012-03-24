class AddUserName < ActiveRecord::Migration
  def self.up
    add_column ("users", "username", :string, :size => 50, :after => "last_name")
  end

  def self.down
    remove_column ("users", "username")
  end
end
