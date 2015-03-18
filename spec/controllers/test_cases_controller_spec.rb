require 'rails_helper'

RSpec.describe TestCasesController, type: :controller do
  let(:test_params) {{title: 'test', description:'lala', criticality:'Low', time: 1}}
  let(:project) {Project.create!({:name => "Project Name", :description => "Project Description"}) }  

  before do 
    @user = User.create!({
    :email => 'users@test.com',
    :password => '12please',
    :password_confirmation => '12please' 
    })
    sign_in @user
  end  

  describe "GET #index" do
    it "returns http success" do
      get :index, project_id: project
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new, project_id: project
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do
    it "returns http success" do
      expect{
        post :create, { project_id: project.id, test_case: test_params }
      }.to change(TestCase, :count).by(1)
      
    end
  end

  describe "GET #show" do
    it "returns http success" do
      test = TestCase.create(test_params)
      get :show, {project_id: project, id: test}
      expect(assigns(:test)).to eq(test)
    end
  end

  describe "GET #edit" do
    it "returns http success" do
      test = TestCase.create(test_params)
      get :edit, {project_id: project, id: test}
      expect(assigns(:test)).to eq(test)
    end
  end

  describe "GET #destroy" do
    it "returns http success" do
      test = TestCase.create(test_params)
      expect{
        delete :destroy, {project_id: project, id: test}
      }.to change(TestCase, :count).by(-1)
    end
  end
end
