class User < ActiveRecord::Base
  attr_accessible :email, :gravatar, :name, :socrates_id
  
  has_many :attempts
  
  validates :socrates_id, presence: true
  validates :email, presence: true
  
end
