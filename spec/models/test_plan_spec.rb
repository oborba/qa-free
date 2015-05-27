require 'rails_helper'

RSpec.describe TestPlan, type: :model do

  let(:test_plan_params) { { test_plan_name:"Test Plan", test_plan_description: "Test Plan Description" } }
  let(:project) { Project.create({ name: "Project Name", description: "Project Description" }) }

  describe "Presence Validate" do
  	it "save valid test plan" do
  		tp = TestPlan.create(test_plan_params)
  		expect(tp.persisted?).to be true
  	end

  	it "do not save empty test_plan" do
  		tp = TestPlan.create
  		expect(tp.persisted?).to be false
  	end

  	it "do not save without a name" do
  		tp = TestPlan.new
  		tp.test_plan_description = "Description"
  		tp.save
  		expect(tp.persisted?).to be false
  	end

  	it "save without a description" do
  		tp = TestPlan.new
  		tp.test_plan_name = "Name"
  		tp.save
  		expect(tp.persisted?).to be true
  	end
  end

  describe "Status" do
    let(:test_case) do
      TestCase.new({
        title: "title", criticality: "Low", status: "Failure", time: 12 
        }
      )
    end

    it "show all failure tests" do
      tp = TestPlan.create(test_plan_params)
      tp.test_cases << test_case
      expect(tp.test_failures.size).to eq(1)
    end
  end
end
