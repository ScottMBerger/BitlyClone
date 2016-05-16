require 'rails_helper'

feature "user creates a url" do
  scenario "successfully creates a url" do
    visit root_path
    click_link "New Url"
    fill_in "Name", with: "Foo.com"
    click_button "Create Url"
    page.should have_content "successfully"
  end
end

feature "counter increments" do
  scenario "succesfully increments" do
    visit root_path
    puts page.find('#count').native.inner_html
    
  end
end