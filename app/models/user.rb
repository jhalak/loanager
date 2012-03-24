class User < ActiveRecord::Base
  scope :searh_all, where(["id > ?", 0])
  scope :searh_by_id, lambda{|id| where(["id = ?", "#{id}"])} 
end
