class TestPlan < ActiveRecord::Base
  has_and_belongs_to_many :test_cases
  belongs_to :project

  validates_presence_of :test_plan_name
end
