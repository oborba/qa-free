require 'rails_helper'

RSpec.describe TestCasesController, type: :controller do
  let(:test_params) { { status: 'Blocked', title: 'test', description: 'lala', criticality: 'Low', time: 1 } }
  let(:project)     { Project.create!(name: 'Project Name', description: 'Project Description') }
  let(:test_plan)   { TestPlan.create!(test_plan_name: 'Test Plan') }

  before do
    @user = User.create!(email: 'users@test.com',
                         password: '12please',
                         password_confirmation: '12please')

    sign_in @user
  end

  describe 'GET #index' do
    it 'returns http success' do
      get :index, project_id: project
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #new' do
    it 'returns http success' do
      get :new, project_id: project, test_plan: test_plan
      expect(assigns[:test_plan]).to be_a TestPlan
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST #create' do
    it 'create with a test_plan reference' do
      expect do
        post :create, project_id: project.id, test_case: test_params, test_plan: { id: test_plan.id }
      end.to change(TestCase, :count).by(1)
    end

    it 'create without a test_plan reference' do
      expect do
        post :create, project_id: project.id, test_case: test_params
      end.to change(TestCase, :count).by(1)
    end
  end

  describe 'GET #show' do
    it 'returns http success' do
      test = TestCase.create(test_params)
      get :show, project_id: project, id: test
      expect(assigns(:test)).to eq(test)
    end
  end

  describe 'GET #edit' do
    it 'returns http success' do
      test = TestCase.create(test_params)
      get :edit, project_id: project, id: test
      expect(assigns(:test)).to eq(test)
    end
  end

  describe 'GET #destroy' do
    it 'returns http success' do
      test = TestCase.create(test_params)
      expect do
        delete :destroy, project_id: project, id: test
      end.to change(TestCase, :count).by(-1)
    end
  end
end
