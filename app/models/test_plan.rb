class TestPlan < ActiveRecord::Base
	belongs_to :project
	validates_presence_of :test_plan_name, :test_plan_description
end
