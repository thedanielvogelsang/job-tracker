require 'rails_helper'

RSpec.feature "User clicks on a category's 'delete' from index page" do
  scenario ", returns to index and sees a page without said category" do
    category = create(:category)
    category2 = create(:category)
    visit categories_path

    expect(page).to have_content(category.title, category2.title)

    within(first("li.delete")) do
        click_on "delete"
      end

    expect(page).to_not have_content(category.title)
    expect(page).to have_content(category2.title)
  end
end
