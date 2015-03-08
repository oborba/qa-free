require 'rails_helper'

RSpec.describe TestPlansController, type: :controller do
  let(:project) {Project.create!({:name => "Project Name", :description => "Project Description"}) }
  let(:plan_params) {{id: "#{Time.now.to_i}", test_plan_name: "Plano de teste", test_plan_description: nil, created_at: "2015-03-02 20:45:20", updated_at: "2015-03-02 20:45:20"}}
  let(:plan_params1) {{id: 1, test_plan_name: "Plano de teste", test_plan_description: nil, created_at: "2015-03-02 20:45:20", updated_at: "2015-03-02 20:45:20"}}
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

  describe "GET #create" do
    it "returns http success" do
      post :create, :test_plan => (plan_params)
      expect(TestPlan.last).to eq(test_plan_created)
    end
  end

  describe "GET #show" do
    it "returns http success" do
      get :show
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #edit" do
    it "returns http success" do
      get :edit
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #destroy" do
    it "returns http success" do
      get :destroy
      expect(response).to have_http_status(:success)
    end
  end
end