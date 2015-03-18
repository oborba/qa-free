require 'rails_helper'

RSpec.describe TestCasesController, type: :controller do
  let(:test_params) {{status: 'Blocked', title: 'test', description:'lala', criticality:'Low', time: 1}}
  
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
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #create" do
    it "returns http success" do
      expect{
        post :create, {test_case: test_params}
      }.to change(TestCase, :count).by(1)
      
    end
  end

  describe "GET #show" do
    it "returns http success" do
      test = TestCase.create(test_params)
      get :show, id: test
      expect(assigns(:test)).to eq(test)
    end
  end

  describe "GET #edit" do
    it "returns http success" do
      test = TestCase.create(test_params)
      get :edit, {id: test}
      expect(assigns(:test)).to eq(test)
    end
  end

  describe "GET #destroy" do
    it "returns http success" do
      test = TestCase.create(test_params)
      expect{
        delete :destroy, {id: test}
      }.to change(TestCase, :count).by(-1)
    end
  end
end
