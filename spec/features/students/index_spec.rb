require 'rails_helper'

RSpec.describe 'student index' do
  before (:each) do
    @snape = Professor.create(name: "Severus Snape", age: 45, specialty: "Potions")
    @hagarid = Professor.create(name: "Rubeus Hagrid", age: 38 , specialty: "Care of Magical Creatures")
    @harry = Student.create(name: "Harry Potter" , age: 11 , house: "Gryffindor" )
    @longbottom = Student.create(name: "Neville Longbottom" , age: 11 , house: "Gryffindor" )
    ProfessorStudent.create(student_id: @harry.id, professor_id: @snape.id)
    ProfessorStudent.create(student_id: @harry.id, professor_id: @hagarid.id)
    ProfessorStudent.create(student_id: @longbottom.id, professor_id: @snape.id)
  end

  it "When I visit '/students'" do
    visit "/students"
    expect(current_path).to eq("/students")
  end

  it "I see a list of students and the number of professors each student has." do
    visit "/students"
    expect(current_path).to eq("/students")
    save_and_open_page
    expect(page).to have_content("Harry Potter: 2")
    expect(page).to have_content("Neville Longbottom: 1")
  end
end
