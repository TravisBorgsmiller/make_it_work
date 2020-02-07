require 'rails_helper'

RSpec.describe 'As a visitor when I visit project show page' do
  before :each do
    @recycled_material_challenge = Challenge.create(theme: "Recycled Material", project_budget: 1000)
    @new_project = @recycled_material_challenge.projects.create(name: "News Chic", material: "Newspaper")
    @contestant1 = @new_project.contestants.create(name: 'john', age: '32', hometown: 'STL', years_of_experience: 4)
    @contestant2 = @new_project.contestants.create(name: 'steve', age: '31', hometown: 'KC', years_of_experience: 2)

  end
  it 'shows project info with theme of challenge it belongs to' do

    visit "/projects/#{@new_project.id}"
    expect(page).to have_content('News Chic')
    expect(page).to have_content('Newspaper')
    expect(page).to have_content("Recycled Material")
  end
  it 'shows number of contestants on project' do
    visit "/projects/#{@new_project.id}"
    expect(page).to have_content('Number of contestants: 2')
  end
end
