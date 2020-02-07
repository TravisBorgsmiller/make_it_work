require 'rails_helper'

RSpec.describe 'As a visitor when I visit contestant index page' do
  it 'shows name of all contestants with projects' do
    recycled_material_challenge = Challenge.create(theme: "Recycled Material", project_budget: 1000)
    project1 = recycled_material_challenge.projects.create(name: "News Chic", material: "Newspaper")
    project2 = recycled_material_challenge.projects.create(name: "Boardfit", material: "Cardboard Boxes")
    project3 = recycled_material_challenge.projects.create(name: "Sobe", material: "Glass")
    contestant1 = project1.contestants.create(name: 'john', age: '32', hometown: 'STL', years_of_experience: 4)
    contestant2 = project2.contestants.create(name: 'steve', age: '31', hometown: 'KC', years_of_experience: 2)

    visit "/contestants"
    expect(page).to have_content('john')
    expect(page).to have_content('steve')
    expect(page).to have_content('News Chic')
    expect(page).to_not have_content('Sobe')
  end
end
