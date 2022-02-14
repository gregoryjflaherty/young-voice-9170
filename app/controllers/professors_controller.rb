class ProfessorsController < ApplicationController
  def index
    @professors = Professor.alphabetical
  end

  def show
    @professor = Professor.find(params[:id])
  end
end
