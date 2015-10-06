class Bug < ActiveRecord::Base
  has_and_belongs_to_many :test_cases
  belongs_to :project
  
  validates_presence_of :bug_title 
end
