require 'rails_helper'

RSpec.describe Project, type: :model do
  let(:project){Project.new}
  describe "create project" do
    it "create project" do
      project.save
      expect(Project.all.length).to eq(1)
    end
  end
end
