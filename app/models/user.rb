class User < ActiveRecord::Base
  attr_accessible :email, :gravatar, :name, :socrates_id

  has_many :attempts
end
