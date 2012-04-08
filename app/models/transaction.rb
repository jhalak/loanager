class Transaction < ActiveRecord::Base
  belongs_to :user
  
  #pagination size
  paginates_per 25
  
  #validations
  validates :title, :presence => true
  validates :description, :presence => true
  validates :from, :presence => true
  validates :to, :presence => true
  validates :amount, :presence => true
  
  ############## Utility function ##############
  def from_name
    user = Person.find_by_id(from)
    #raise user.inspect
    return user.full_name
  end
  
  def to_name
    user = Person.find_by_id(to)
    user.present? ? user.full_name : ""
  end
end
