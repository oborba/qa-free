class TestPlan < ActiveRecord::Base
  has_and_belongs_to_many :test_cases
  belongs_to :project

  validates_presence_of :test_plan_name

  def number_of_tests(test_status)
    tests = []
    self.test_cases.each do |test_case|
      tests << test_case if test_case.status == test_status
    end
    tests.count
  end
end
