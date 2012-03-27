class User < ActiveRecord::Base
  
  has_many :persons
  has_many :transactions
  
  validates_presence_of :username, :email, :password
  validates_uniqueness_of :username
  
  scope :searh_all, where(["id > ?", 0])
  scope :searh_by_id, lambda{|id| where(["id = ?", "#{id}"])} 
end
