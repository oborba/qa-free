require 'rails_helper'

RSpec.describe BugsController, type: :controller do

  before do
    @user = User.create!(email: 'users@test.com',
                         password: '12please',
                         password_confirmation: '12please')

    sign_in @user
  end
  
  let(:project) do
    Project.create(
      name: 'Project Name',
      description: 'Project Description'
    )
  end

  describe "GET #index" do
    it "returns http success" do
      get :index, project_id: project
      expect(response).to have_http_status(:success)
    end
  end
end
