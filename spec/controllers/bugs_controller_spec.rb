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

  let(:bug_other_project) do
    Bug.create(
      bug_title: 'Other Project',
      bug_description: 'Bug desc',
      project_id: nil
    )
  end

  let(:bug1) do
    Bug.create(
      bug_title: 'Bug My Project 1',
      bug_description: 'Bug desc',
      project_id: project.id
    )
  end

  let(:bug2) do
    Bug.create(
      bug_title: 'Bug My Project 2',
      bug_description: 'Bug desc',
      project_id: project.id
    )
  end


  describe 'GET #index' do
    it 'returns http success' do
      get :index, project_id: project

      expect(response).to have_http_status(:success)
    end

    it 'render index template' do
      get :index, project_id: project

      expect(response).to render_template(:index)
    end

    context 'Show Bug List' do
      it 'render just project bugs' do
        get :index, project_id: project

        expect(assigns(:bugs))
          .to eq([bug1, bug2])
      end
    end
  end
end
