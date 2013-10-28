class Doc < ActiveRecord::Base
  attr_accessible :challenge_id, :html, :method

  belongs_to :challenge
end
