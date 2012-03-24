class AlterUser < ActiveRecord::Migration
  def self.up
    add_column("users", "password", :string, :after => "email")
  end

  def self.down
    remove_column("users", "password")
  end
end