class Project < ActiveRecord::Base
  has_many :test_plans
  has_many :test_cases
  has_many :bugs

  validates_presence_of :name
end
