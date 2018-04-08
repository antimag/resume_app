require 'education_detail'

describe EducationDetail do
  let(:education_name) { "Graduation" }
  let(:collage_name) { "NSCB Govt PG Collage Biaora" }
  let(:percent) {"75"}
  let(:university){"Barkattullah university Bhopal"}

  describe '#intialize' do
    it 'instantiates the EducationDetail class with 4 arguments' do
      education_detail = EducationDetail.new(education_name,collage_name,percent,university)
      expect(education_detail.collage_name).to eql("NSCB Govt PG Collage Biaora")
      expect(education_detail.university).to eql("Barkattullah university Bhopal")
      expect(education_detail.education_name).to eql("Graduation")
      expect(education_detail.percent).to eql("75")
    end
  end
  
end