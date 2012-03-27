class AddActiveToUser < ActiveRecord::Migration
  def self.up
    add_column "users", "active", :integer, {:size => 1, :default => 1, :after => "email"}
  end

  def self.down
    remove_column "users", "active"
  end
end
