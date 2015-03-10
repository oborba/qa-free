class Test < ActiveRecord::Base
  	validates_presence_of :title, :description, :criticality, :time
  	validates_length_of :title, maximum: 100
  	validates :criticality, inclusion: { in: %w(Low Medium Critical)}
end