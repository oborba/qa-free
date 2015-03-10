class Project < ActiveRecord::Base
  has_many :test_plans
	validates_presence_of :name, :description
end
