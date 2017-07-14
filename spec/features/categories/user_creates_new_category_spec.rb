require 'rails_helper'

RSpec.feature "User creates new category" do
  scenario "with unique title and sees it on the following page with matching title" do
    visit new_category_path

    fill_in "Title", with: "Depressing Work"
    click_on "Create Category"
    expect(page).to have_content("Depressing Work")
  end

  scenario "with same title and sees and error message" do
    expect(page).to have_content("")
  end

  scenario "and sees a link back to category index" do

  end
end
