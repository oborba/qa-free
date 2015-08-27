require 'rails_helper'

RSpec.describe ProjectsController, type: :controller do
  let(:project_params) { { name: 'test', description: 'lala' } }

  before do
    @admin = Admin.create!(email: 'admin@test.com',
                           password: '12please',
                           password_confirmation: '12please')
    sign_in @admin
  end

  describe 'GET #index' do
    it 'returns http success' do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #new' do
    it 'returns http success' do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #create' do
    it 'returns http success' do
      expect do
        post :create, project: project_params
      end.to change(Project, :count).by(1)
    end
  end

  describe 'GET #show' do
    it 'returns http success' do
      project = Project.create(project_params)
      get :show, id: project
      expect(assigns(:project)).to eq(project)
    end
  end

  describe 'GET #edit' do
    it 'returns http success' do
      project = Project.create(project_params)
      get :edit, id: project
      expect(assigns(:project)).to eq(project)
    end
  end

  describe 'GET #destroy' do
    it 'returns http success' do
      project = Project.create(project_params)
      expect do
        delete :destroy, id: project
      end.to change(Project, :count).by(-1)
    end
  end
end
