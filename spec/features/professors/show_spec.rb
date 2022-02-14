require 'rails_helper'

RSpec.describe 'professor index' do
  before (:each) do
    @snape = Professor.create(name: "Severus Snape", age: 45, specialty: "Potions")
    @harry = Student.create(name: "Harry Potter" , age: 11 , house: "Gryffindor" )
    @longbottom = Student.create(name: "Neville Longbottom" , age: 11 , house: "Gryffindor" )
    ProfessorStudent.create(student_id: @harry.id, professor_id: @snape.id)
    ProfessorStudent.create(student_id: @longbottom.id, professor_id: @snape.id)
  end

  it "When I visit '/professors/:id'" do
    visit "/professors/#{@snape.id}"
    expect(current_path).to eq("/professors/#{@snape.id}")
  end

  it "I see a list of the names of the students the professors have" do
    visit "/professors/#{@snape.id}"
    expect(current_path).to eq("/professors/#{@snape.id}")

    expect(page).to have_content("Harry Potter")
    expect(page).to have_content("Neville Longbottom")
  end
end
