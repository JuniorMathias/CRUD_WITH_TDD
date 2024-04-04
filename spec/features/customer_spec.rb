require 'rails_helper'

RSpec.feature "Customers", type: :feature do
  scenario 'Verify Register customer link' do 
    visit(root_path)
    expect(page).to  have_link('Create a Customer')
  end 

  scenario 'Verify link of Register a new customer' do 
    visit(root_path)
    click_on('Create a Customer')
    expect(page).to  have_content("Customer List")
    expect(page).to  have_link('New Customer')
  end 

  scenario 'Verify new customer form' do 
    visit(customers_path)
    click_on('New Customer')
    expect(page).to  have_content("New Customer")
  end 


end
