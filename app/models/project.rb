class Project < ActiveRecord::Base
  has_many :test_plans
  has_many :test_cases
  
	validates_presence_of :name
end
