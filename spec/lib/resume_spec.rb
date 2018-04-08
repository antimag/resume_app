require 'resume'
describe Resume do
  let(:education_name) { "Graduation test" }
  let(:collage_name) { "NSCB Govt PG Collage Biaora" }
  let(:percent) {"75"}
  let(:university){"Barkattullah university Bhopal"}
  let(:title) { "Project 1 test" }
  let(:description) { "Project description" }

  before do
    file = File.read('public/resume.json')
    @data_hash = JSON.parse(file)
    @resume = Resume.new
  end
  
  describe '#intialize' do
    it 'instantiates the Resume class' do
      expect(@resume.name).to eql(@data_hash["name"])
      expect(@resume.email).to eql(@data_hash["email"])
      expect(@resume.education_details.first.education_name).to eql(@data_hash["education_details"][0].keys.first)
      expect(@resume.project_details.first.title).to eql(@data_hash["project_details"][0]["title"])
    end
  end

  describe "#add content to resume" do
       
    it "should add content in resume" do
      @data_hash = { "name":"test name", "education_details": [{"Graduation test": { "collage name": "test PG Collage", "percent": "78", "university": "test university" } }] }
      @resume.add(@data_hash)
      resume = Resume.new
      expect(resume.name).to eql(@data_hash[:name])
      expect(resume.education_details.first.education_name).to eql("Graduation test")
    end

  end

  describe "#read resume content" do
    it "should read content from resume file" do
      @resume.read
      expect(@resume.project_details.first.title).to eql(@data_hash["project_details"][0]["title"])
    end
  end

  describe "#delete resume content" do
    it "should remove content from resume" do
      @resume.delete("name")
      resume = Resume.new
      expect(resume.name).to eql(nil)
    end
  end
end