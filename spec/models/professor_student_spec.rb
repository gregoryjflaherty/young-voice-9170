require 'rails_helper'

RSpec.describe ProfessorStudent, type: :model do

  describe 'relationships' do
    it {should belong_to :professor}
    it {should belong_to :student}
  end

  describe 'methods' do
    before (:each) do
      @snape = Professor.create(name: "Severus Snape", age: 45, specialty: "Potions")
      @harry = Student.create(name: "Harry Potter" , age: 11 , house: "Gryffindor" )
      @malfoy = Student.create(name: "Draco Malfoy" , age: 12 , house: "Slytherin" )
      @longbottom = Student.create(name: "Neville Longbottom" , age: 11 , house: "Gryffindor" )
      ProfessorStudent.create(student_id: @harry.id, professor_id: @snape.id)
      ProfessorStudent.create(student_id: @malfoy.id, professor_id: @snape.id)
      ProfessorStudent.create(student_id: @longbottom.id, professor_id: @snape.id)
    end

    it 'gives average age of students per professor' do
      expect(@snape.avg_student_age).to eq(11)
    end
  end
end
