require 'rails_helper'

RSpec.describe TestPlansController, type: :controller do
  let(:project) {Project.create!({:name => "Project Name", :description => "Project Description"}) }
  let(:plan_params) { { test_plan_name: "TestPlan", test_plan_description: "TestPlan Description", project_id: project } }
  let(:test_plan_created) {TestPlan.create(plan_params)}
  
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
    it "create a test plan" do
      expect {
        post :create, {project_id: project, test_plan: plan_params}
      }.to change(TestPlan, :count).by(1)
    end
  end

  describe "GET #show" do
    it "show the requested test plan" do
      tp = TestPlan.create(plan_params)
      get :show, {project_id: project, id: tp}
      expect(assigns(:test_plan)).to eq(tp)
    end
  end

  describe "GET #edit" do
    it "get edit" do
      tp = TestPlan.create(plan_params)
      get :edit, {project_id: project, id: tp}
      expect(assigns(:test_plan)).to eq(tp)
    end
  end

  describe "DELETE #destroy" do
    it "destroy test plan" do
      tp = TestPlan.create(plan_params)
      expect {
        delete :destroy, {project_id: project, id: tp}
      }.to change(TestPlan, :count).by(-1)
    end
  end
end