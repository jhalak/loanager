class CreatePeople < ActiveRecord::Migration
  def self.up
    create_table :people do |t|
      t.string :name
      t.references :user
      t.integer :is_user, :default => 0, :size => 1
      t.timestamps
    end
    Person.create(:name => "Admin User", :user_id => 1, :is_user => 1)
  end

  def self.down
    drop_table :people
  end
end