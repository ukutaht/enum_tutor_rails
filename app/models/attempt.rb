class Attempt < ActiveRecord::Base
  attr_accessible :attempt_text, :challenge_id, :passed, :user_id
  
  belongs_to :challenge
  belongs_to :user

  validates :attempt_text, presence: true


  
end
