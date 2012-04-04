class Person < ActiveRecord::Base
  belongs_to :user
  
  #validation 
  validates :name, :presence => true 
  
  def full_name
    "#{name}"
  end
end
