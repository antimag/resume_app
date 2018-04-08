class EducationDetail
  attr_reader :education_name, :collage_name, :percent, :university

  def initialize(education_name,collage_name, percent,university)
    @education_name = education_name
    @collage_name = collage_name
    @percent = percent
    @university = university
  end
end
