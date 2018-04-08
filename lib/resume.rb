require 'json'
require_relative 'education_detail'
require_relative 'project_detail'

class Resume
  attr_accessor :education_details, :project_details
  attr_reader :name, :email
  def initialize()
    file = File.read('public/resume.json')
    @data_hash = JSON.parse(file)
    @name=@data_hash["name"]
    @email = @data_hash["email"]
    @education_details =[]
    @project_details = []
    if @data_hash["education_details"]
      @data_hash["education_details"][0].each do|education_detail|
       @education_details << EducationDetail.new(education_detail[0],education_detail[1]["collage name"], education_detail[1]["percent"],education_detail[1]["university"])
      end
    end
    if @data_hash["project_details"]
      @data_hash["project_details"].each do|project_detail|
       @project_details << ProjectDetail.new(project_detail["title"],project_detail["description"])
      end
    end
  end

  def read
    puts "Name: #{self.name}\n--------------------"
    puts "Email: #{self.email}\n--------------------"
    puts "EducationDetail:\n--------------------"
    self.education_details.each do|education_detail|
      puts "#{education_detail.education_name}:\n"
      puts"---------------------------------------"
      puts "Collage Name: #{education_detail.collage_name}\n"
      puts "Percentage: #{education_detail.percent}\n"
      puts "University: #{education_detail.university}\n"
      puts"---------------------------------------"
    end
    puts "ProjectDetail:\n--------------------"
    self.project_details.each do|project_detail|
      puts "Title: #{project_detail.title}:\n"
      puts"---------------------------------------"
      puts "Description: #{project_detail.description}\n"
      puts"---------------------------------------"
    end
  end

  def add(resume_details)
    data_hash=@data_hash.merge(resume_details)
    write_data(data_hash)
    puts "Resume content updated successfully."
  end


  def delete(delete_content)
    new_data_hash = {}
    if @data_hash.keys.include?(delete_content)
      @data_hash.delete(delete_content)
      new_data_hash = @data_hash
      write_data(new_data_hash)
      puts "Resume content deleted successfully."
    else
      puts "#{delete_content} not found."
    end
  end
  
  private
  def write_data(data_hash)
    File.open("public/resume.json","w") do |f|
      f.write(data_hash.to_json)
    end
  end
end