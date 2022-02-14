class StudentsController < ApplicationController
  def index
    @students = Student.alphabetical
  end
end
