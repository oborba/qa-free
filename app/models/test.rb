class Test < ActiveRecord::Base
  	validates_presence_of :title, :description, :criticality, :time
end