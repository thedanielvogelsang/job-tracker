require 'rails_helper'

RSpec.feature "User creates new category" do
  # scenario "with unique title and sees it on the following page with matching title" do
  #   visit new_category_path
  #
  #   fill_in "Title", with: "Depressing Work"
  #   click_on "Create Category"
  #   expect(page).to have_content("Depressing Work")
  # end

  scenario "with same title and sees and error message" do
    category_un = create(:category)
    category_deux = create(:category)
    category_trois = create(:category)

    visit new_category_path
    fill_in "Title", with: "#{category_un.title}"
    click_on "Create Category"

    expect(page).to have_content("Title has already been taken")
  end

  # scenario "and sees a link back to category index" do
  #   visit new_category_path
  #
  #   fill_in "Title", with: "Anything"
  #   click_on "Create Category"
  #   click_on "<< Back to Index"
  #   expect(page).to have_content("Anything")
  #   expect(page).to have_content(category_un.name)
  # end
end
