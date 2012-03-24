class User < ActiveRecord::Base
  
  has_many :persons
  has_many :transactions
  
  scope :searh_all, where(["id > ?", 0])
  scope :searh_by_id, lambda{|id| where(["id = ?", "#{id}"])} 
end
