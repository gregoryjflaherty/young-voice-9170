require 'rails_helper'

RSpec.describe 'professor index' do
  before (:each) do
    snape = Professor.create(name: "Severus Snape", age: 45, specialty: "Potions")
    hagarid = Professor.create(name: "Rubeus Hagrid", age: 38 , specialty: "Care of Magical Creatures")
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
end
