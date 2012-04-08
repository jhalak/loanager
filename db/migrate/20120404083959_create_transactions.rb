class CreateTransactions < ActiveRecord::Migration
  def self.up
    create_table :transactions do |t|
      t.string :title
      t.text :description
      t.integer :from
      t.integer :to
      t.float :amount
      t.integer :is_paid, :size => 1, :default => 0
      t.references :user

      t.timestamps
    end
  end

  def self.down
    drop_table :transactions
  end
end
