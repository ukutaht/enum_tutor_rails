class User < ActiveRecord::Base
  attr_accessible :email, :gravatar, :name, :socrates_id
  
  has_many :attempts
  
  validates :socrates_id, presence: true
  validates :email, presence: true

  def self.from_auth(user_attributes)
    where(user_attributes.slice(:id, :name)).first_or_initialize.tap do |user|
      user.socrates_id = user_attributes.id
      user.name = user_attributes.name
      user.email = user_attributes.email
      user.gravatar = user_attributes.gravatar
      user.save!
    end
  end

  def completed?(challenge)
    completed_challenges.include?(challenge)
  end

  def progress
    ((completed_challenges.count / Challenge.all.count.to_f)*100).to_i
  end

  def attempts_for(id)
    attempts.where(:challenge_id => id)
  end

  private

  def completed_challenges
    attempts.where(:passed => true).count(:group => :challenge).keys
  end

end
