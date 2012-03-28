require 'digest/sha1'

class User < ActiveRecord::Base
  
  # define relationships
  has_many :persons
  has_many :transactions
  
  # attribute accessors property
  attr_accessor :password  
  # normal property
  attr_protected :hashed_password, :salt
  
  
  # add validation
  validates_presence_of :username, :email
  validates_uniqueness_of :username
  validates_presence_of :password, :on => "create"
  # define filters 
  # create hashed password before saving the User object into database
  before_save :create_hashed_password
  # clear the password so that it doesn't always update 
  after_save :clear_password
  
  # custom model search method  
  scope :searh_all, where(["id > ?", 0])
  scope :searh_by_id, lambda{|id| where(["id = ?", "#{id}"])}
  
  
  
  def self.make_salt username = ""
    Digest::SHA1.hexdigest "#{username}#{Time.now}"
  end
  
  def self.hash_with_salt password = "", salt = ""    
    Digest::SHA1.hexdigest "#{salt}#{password}"
  end
  
  #private methods
  private 
  def create_hashed_password
    #when password have a value
    unless password.blank?
      self.salt = User.make_salt username if self.salt.blank?      
      self.hashed_password = User.hash_with_salt password, salt
    end
  end
  
  def clear_password
    self.password = nil
  end 
    
end
