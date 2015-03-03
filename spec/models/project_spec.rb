require 'rails_helper'

RSpec.describe Project, type: :model do
  
  let(:project_params) { {name:"teste",description: "validate"} }
  
  describe "Presence Validate" do
    
    it "save valid project" do
      project = Project.create (project_params)
      expect(project.persisted?).to be true
    end  
    
    it "do not save invalid project" do
      project = Project.create
      expect(project.persisted?).to be false
    end
  end
end

