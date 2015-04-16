class TestCase < ActiveRecord::Base
  has_and_belongs_to_many :test_plans
  belongs_to :project

  validates_presence_of :title, :criticality, :time
  validates_length_of :title, maximum: 100
  validates_numericality_of :time
  validates :criticality, inclusion: { in: %w(Low Medium Critical)}
  validates :status, inclusion: { in: %w(Not_Executed Blocked Passed Failure)}

  def has_test_plan?
  	self.test_plans.size >= 1
  end
end
