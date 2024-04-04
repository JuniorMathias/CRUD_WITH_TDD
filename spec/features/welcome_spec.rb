require 'rails_helper'

feature "Welcome", type: :feature do
  scenario 'Show welcome message' do 
    visit(root_path)
    expect(page).to have_content('WELCOME')
  end 

  scenario 'verify link to create a customer' do
    visit(root_path)
    # expect(page).to have_selector('ul li a')
    # expect(page).to have_link('Create a Customer')
    expect(find('ul li')).to have_link('Create a Customer')
  end
end
