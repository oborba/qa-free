require 'rails_helper'

RSpec.describe TestCase, type: :model do
  let(:test_params) { { status: 'Blocked', title: 'Title', description: 'Description', criticality: 'Low', time: 20 } }
  let(:test_plan) { TestPlan.create(test_plan_name: 'TestPlan Name', test_plan_description: 'Test Plan Description') }

  describe 'Presence Validate' do
    it 'save valid test' do
      test = TestCase.create(test_params)
      expect(test.persisted?).to be true
    end

    it 'do not save empty test' do
      test = TestCase.create
      expect(test.persisted?).to be false
    end

    it 'do not save without Title' do
      test = TestCase.new(test_params)
      test.title = nil
      test.save
      expect(test.persisted?).to be false
    end

    it 'save without a Description' do
      test = TestCase.new(test_params)
      test.description = nil
      test.save
      expect(test.persisted?).to be true
    end

    it 'do not save without Criticality' do
      test = TestCase.new(test_params)
      test.criticality = nil
      test.save
      expect(test.persisted?).to be false
    end

    it 'do not save without Time' do
      test = TestCase.new(test_params)
      test.time = nil
      test.save
      expect(test.persisted?).to be false
    end
  end

  describe '#has_test_plan?' do
    let(:has_test_plan?) { @test_case.has_test_plan? }

    before do
      @test_case = TestCase.new(test_params)
    end

    context 'when have test plan' do
      it 'should be true' do
        @test_case.test_plans << test_plan
        expect(has_test_plan?).to eq(true)
      end
    end

    context "when don't have test plan" do
      it { expect(has_test_plan?).to eq(false) }
    end
  end

  describe 'bugs' do
    let(:bug) do 
      Bug.create(
        bug_title: 'title', 
        bug_description: 'desc'
      )
    end

    let(:test_params) do 
      { 
        status: 'Blocked', 
        title: 'Title', 
        description: 'Description', 
        criticality: 'Low', 
        time: 20, 
        bugs: [bug]
      }
    end

    let(:test_case) { TestCase.create(test_params) }

    context 'test case with bug' do
      it { expect(test_case.bugs.size).to eq(1) }
    end
  end
end
