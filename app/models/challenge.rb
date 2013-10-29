class Challenge < ActiveRecord::Base
  attr_accessible :challenge_order, :expected_output, :initial_data, :name, :problem_statement

  has_one :doc
  has_many :attempts

  validates :name, presence: true
  validates :problem_statement, presence:true
  validates :initial_data, presence: true
  validates :expected_output, presence: true
  validate :check_initial_data
  validate :check_expected_output

  after_create :init_order

  default_scope order('challenge_order')

  def evaluated_output
    eval expected_output
  end
  private

  def init_order
    self.challenge_order ||=  self.id
    self.save
  end


  def check_initial_data
    begin
      eval initial_data
    rescue Exception => e
      errors.add(:given_data,"doesn't evaluate to a ruby object")
    end
  end

  def check_expected_output
    begin
      evaluated_output
    rescue Exception => e
      errors.add(:expected_output, "doesn't evaluate to a ruby object")
    end
  end

end
