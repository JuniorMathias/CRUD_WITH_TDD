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

  scenario 'Verify a new valid customer' do 
    visit(new_customer_path)
    customer_name = Faker::Name.name
    fill_in('Name', with: customer_name)
    fill_in('Email', with: Faker::Internet.email)
    fill_in('Phone', with: Faker::PhoneNumber.phone_number)
    attach_file('Profile Photo', "#{Rails.root}/spec/fixtures/avatar.png")
    choose(option: ['S','N'].sample)

    click_on('Register Customer')
    expect(page).to  have_content("Customer Registered Successfully")
    expect(Customer.last.name).to eq(customer_name)
  end 


end
