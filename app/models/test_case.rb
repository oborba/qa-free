class TestCase < ActiveRecord::Base
  has_and_belongs_to_many :test_plans

  validates_presence_of :title, :criticality, :time
  validates_length_of :title, maximum: 100
	validates_numericality_of :time
  validates :criticality, inclusion: { in: %w(Low Medium Critical)}
end
