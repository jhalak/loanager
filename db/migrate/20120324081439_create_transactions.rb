class CreateTransactions < ActiveRecord::Migration
  def self.up
    create_table :transactions do |t|
      t.string  "title"
      t.text    "description"  
      t.integer "from"
      t.integer "to"
      t.float   "amount"
      t.references "user_id"
      t.timestamps
    end
  end

  def self.down
    drop_table :transactions
  end
end
