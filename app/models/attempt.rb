class Attempt < ActiveRecord::Base
  attr_accessible :attemp_text, :challenge_id, :passed, :user_id

  validates :attempt_text, presence: true
  
  belongs_to :challenge
  belongs_to :user
end
