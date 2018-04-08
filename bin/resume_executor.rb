require_relative '../lib/resume'
require 'byebug'
def add_info
  hash = {}
  input_values=["name","email","education_details","project_details"]
  education_details = ["Graduation","Post Graduation"]
  project_details = ["title","description"]
  input_values.each do|input|
    puts "#{input} :"
    case input
    when "education_details"
      education = []
      education_detail_hash = {}
      education_details.each do|education_detail|
        puts "#{education_detail} Information :"
        info = {}
        ["collage name","percent","university"].each do|i|
          puts "#{i} :"
          info[i] = gets.chomp
        end
        education_detail_hash[education_detail]= info
      end
      education << education_detail_hash
      hash[input]= education
    when "project_details"
      projects = []
      puts "Total number of projects :"
      number_of_projects = gets.chomp
      number_of_projects = number_of_projects.to_i
      project_count = 0
      if number_of_projects >= 1
        (1..number_of_projects).each do|project|
          project_count=+1
          project_detail_hash = {}
          project_details.each do|project_detail|
            puts "#{project_detail} :"
            project_detail_hash[project_detail]=gets.chomp 
          end
          projects<< project_detail_hash
        end
      end
      hash[input]= projects
    else
      value = gets.chomp
      hash[input]=value
    end
  end
  resume = Resume.new
  resume.add(hash)
end

def delete_info
  input_values=["name","email","education_details","project_details"]
  puts "please chose any one from these #{input_values.join(',')}"
  content = gets.chomp
  resume = Resume.new
  resume.delete(content)
end

def retrive_data
  resume = Resume.new
  resume.read
end

puts "Please Select choice :"
puts "Press 1 for Add"
puts "Press 2 for delete"
puts "Press 3 for read"
data = gets.chomp

case data
when "1"
  add_info
when "2"
  delete_info
when "3"
  retrive_data
end