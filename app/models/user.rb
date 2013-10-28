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

end
