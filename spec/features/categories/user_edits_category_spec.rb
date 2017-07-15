require "rails_helper"

RSpec.feature "User edits category" do
  scenario "and, after entering new data, sees updated category page" do
    category = create(:category)
    visit edit_category_path(category)
    expect(page).to have_content(category.title)
    fill_in "Title", with: "New Title"
    click_on "Update Category"

    expect(page).to have_content("New Title")
  end

  context "and, after deleting current title, clicks update" do
    scenario "and sees an error message" do
      category = create(:category)
      visit edit_category_path(category)
      fill_in "Title", with: nil
      click_on "Update Category"

      expect(page).to have_content("Title can't be blank")
    end
  end
end
