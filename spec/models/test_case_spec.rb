require 'rails_helper'

RSpec.describe TestCase, type: :model do

  let(:test_params) { { title: "Title", description: "Description", criticality: "Low", time: 20 } }
  let(:test_plan) { TestPlan.create({ test_plan_name: "TestPlan Name", test_plan_description: "Test Plan Description" }) }

  describe "Presence Validate" do
  	it "save valid test" do
  		test = TestCase.create(test_params)
  		expect(test.persisted?).to be true
  	end

    it "do not save empty test" do
      test = TestCase.create
      expect(test.persisted?).to be false
    end

    it "do not save without Title" do
      test = TestCase.new(test_params)
      test.title = nil
      test.save
      expect(test.persisted?).to be false
    end

    it "save without a Description" do
      test = TestCase.new(test_params)
      test.description = nil
      test.save
      expect(test.persisted?).to be true
    end

    it "do not save without Criticality" do
      test = TestCase.new(test_params)
      test.criticality = nil
      test.save
      expect(test.persisted?).to be false
    end

    it "do not save without Time" do
      test = TestCase.new(test_params)
      test.time = nil
      test.save
      expect(test.persisted?).to be false
    end
  end
end
