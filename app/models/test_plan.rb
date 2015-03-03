class TestPlan < ActiveRecord::Base
	validates_presence_of :test_plan_name, :test_plan_description
end
