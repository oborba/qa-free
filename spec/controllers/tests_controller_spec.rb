require 'rails_helper'

RSpec.describe TestsController, type: :controller do
  let(:test_params) {{title: 'test', description:'lala', criticality:'test', time: 1}}
  
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
        post :create, {test: test_params}
      }.to change(Test, :count).by(1)
      
    end
  end

  describe "GET #show" do
    it "returns http success" do
      test = Test.create(test_params)
      get :show, id: test
      expect(assigns(:test)).to eq(test)

    end
  end

  describe "GET #edit" do
    it "returns http success" do
      test = Test.create(test_params)
      get :edit, {id: test}
      expect(assigns(:test)).to eq(test)
    end
  end

  describe "GET #destroy" do
    it "returns http success" do
      test = Test.create(test_params)
      expect{
        delete :destroy, {id: test }
      }.to change(Test, :count).by(-1)
    end
  end
end
