require 'rails_helper'

RSpec.describe 'professor index' do
  before (:each) do
    @snape = Professor.create(name: "Severus Snape", age: 45, specialty: "Potions")
    @hagarid = Professor.create(name: "Rubeus Hagrid", age: 38 , specialty: "Care of Magical Creatures")
    @harry = Student.create(name: "Harry Potter" , age: 11 , house: "Gryffindor" )
    @longbottom = Student.create(name: "Neville Longbottom" , age: 12 , house: "Gryffindor" )
    ProfessorStudent.create(student_id: @harry.id, professor_id: @snape.id)
    ProfessorStudent.create(student_id: @longbottom.id, professor_id: @snape.id)
  end

  it "When I visit '/professors'," do
    visit '/professors'
    expect(current_path).to eq('/professors')
  end

  it "I see a list of professors with the following information: Name,Age,Specialty" do
    visit '/professors'
    expect(current_path).to eq('/professors')

    expect(page).to have_content("Severus Snape")
    expect(page).to have_content("Rubeus Hagrid")
    expect(page).to have_content(45)
    expect(page).to have_content(38)
    expect(page).to have_content("Potions")
    expect(page).to have_content("Care of Magical Creatures")
  end

  it "I see the average age of all students for that professor" do
    visit '/professors'
    expect(current_path).to eq('/professors')

    expect(page).to have_content("Severus Snape")
    expect(page).to have_content("Average Age: 11.5")
  end

  it 'sorts professors alphabetically' do
    visit '/professors'
    save_and_open_page

    within '#prof_index' do
      expect(page.all('.professor')[0]).to have_content('Rubeus Hagrid')
      expect(page.all('.professor')[1]).to have_content('Severus Snape')
    end
  end
end
