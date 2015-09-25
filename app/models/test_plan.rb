class TestPlan < ActiveRecord::Base
  has_and_belongs_to_many :test_cases
  belongs_to :project

  validates_presence_of :test_plan_name

  def number_of_tests(test_status)
    test_cases.select { |test_case| test_case.status == test_status }.count
  end
end
