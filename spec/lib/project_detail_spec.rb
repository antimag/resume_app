require 'project_detail'

describe ProjectDetail do
  let(:title) { "Project 1" }
  let(:description) { "Project description" }
  
  describe '#intialize' do
    it 'instantiates the ProjectDetail class with 2 arguments' do
      project_detail = ProjectDetail.new(title,description)
      expect(project_detail.title).to eql("Project 1")
      expect(project_detail.description).to eql("Project description")
    end
  end
  
end