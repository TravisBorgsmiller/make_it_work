require 'rails_helper'

RSpec.describe 'As a visitor when I visit project show page' do
  it 'shows project info with theme of challenge it belongs to' do
    recycled_material_challenge = Challenge.create(theme: "Recycled Material", project_budget: 1000)
    new_project = recycled_material_challenge.projects.create(name: "News Chic", material: "Newspaper")

    visit "/projects/#{new_project.id}"
    expect(page).to have_content('News Chic')
    expect(page).to have_content('Newspaper')
    expect(page).to have_content("Recycled Material")
  end
end 
