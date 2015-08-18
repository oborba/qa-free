require 'rails_helper'

RSpec.describe TestPlan, type: :model do
  let(:test_plan_params) { { test_plan_name: 'Test Plan', test_plan_description: 'Test Plan Description' } }
  let(:project) { Project.create(name: 'Project Name', description: 'Project Description') }

  describe 'Presence Validate' do
    it 'save valid test plan' do
      tp = TestPlan.create(test_plan_params)
      expect(tp.persisted?).to be true
    end

    it 'do not save empty test_plan' do
      tp = TestPlan.create
      expect(tp.persisted?).to be false
    end

    it 'do not save without a name' do
      tp = TestPlan.new
      tp.test_plan_description = 'Description'
      tp.save
      expect(tp.persisted?).to be false
    end

    it 'save without a description' do
      tp = TestPlan.new
      tp.test_plan_name = 'Name'
      tp.save
      expect(tp.persisted?).to be true
    end
  end

  describe '.number_of_tests' do
    let(:test_case_failure) do
      TestCase.new(title: 'title', criticality: 'Low', status: 'Failure', time: 12
                  )
    end

    let(:test_case_blocked) do
      TestCase.new(title: 'title', criticality: 'Low', status: 'Blocked', time: 12
                  )
    end

    let(:test_case_passed) do
      TestCase.new(title: 'title', criticality: 'Low', status: 'Passed', time: 12
                  )
    end

    let(:test_case_not_executed) do
      TestCase.new(title: 'title', criticality: 'Low', status: 'Not_Executed', time: 12
                  )
    end

    it 'show passed tests' do
      tp = TestPlan.new(test_plan_params)
      tp.test_cases << test_case_passed
      expect(tp.number_of_tests('Passed')).to eq(1)
    end

    it 'show not executed tests' do
      tp = TestPlan.new(test_plan_params)
      tp.test_cases << test_case_not_executed
      expect(tp.number_of_tests('Not_Executed')).to eq(1)
    end

    it 'show failure tests' do
      tp = TestPlan.new(test_plan_params)
      tp.test_cases << test_case_failure
      expect(tp.number_of_tests('Failure')).to eq(1)
    end

    it 'show blocked tests' do
      tp = TestPlan.new(test_plan_params)
      tp.test_cases << test_case_blocked
      expect(tp.number_of_tests('Blocked')).to eq(1)
    end
  end
end
