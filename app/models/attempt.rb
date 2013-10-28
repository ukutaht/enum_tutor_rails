class Attempt < ActiveRecord::Base
  attr_accessible :attemp_text, :challenge_id, :passed, :user_id
end
