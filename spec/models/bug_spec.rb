require 'rails_helper'

RSpec.describe Bug, type: :model do
  describe 'Creating a bug' do
    let(:project) do
      Project.create(
        name: 'project_title', 
        description: 'dsdsdsdsdsd'
      )
    end
    
    let(:test_case) do
      TestCase.create(
        status: 'Blocked', 
        title: 'Title', 
        description: 'Description', 
        criticality: 'Low', 
        time: 20 
      )
    end
   
    context 'with valid params' do
      let(:valid_params) do
        {
          bug_title: 'to fix', 
          bug_description: 'my desc',
          project_id: 1
        }
      end

      it 'compare project id' do
        bug = Bug.create(valid_params)
        expect(bug.project_id).to eq(project.id)
      end

      it 'save' do
        bug = Bug.create(valid_params)
        expect(bug.persisted?).to be true
      end
    end
    
    context 'test case' do
      let(:without_test_case) do
        {
          bug_title: 'to fix', 
          bug_description: 'my desc',
          project_id: 1
        }
      end

      let(:with_test_case) do
        {
          bug_title: 'to fix',
          bug_description: 'my desc',
          project_id: 1,
          test_cases: [test_case]
        }
      end

      it 'without test case' do
        bug = Bug.create(without_test_case)
        expect(bug.test_cases).to eq([])
      end
      
      it 'with test case' do
        bug = Bug.create(with_test_case)
        expect(bug.test_cases.size).to eq(1)
      end
    end

    context 'with invalid params' do
      let(:invalid_params) do
        {
          bug_description: 'my desc'
        }
      end

      it 'don\'t save' do
        bug = Bug.create(invalid_params)
        expect(bug.persisted?).to be false
      end
    end
  end
end
