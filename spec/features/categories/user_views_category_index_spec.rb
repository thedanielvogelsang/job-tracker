require 'rails_helper'

RSpec.feature "User views category index" do
  scenario "and sees a list of category titles that link to their show page" do
    category1, category2, category3 = create_list(:category, 3)

    visit categories_path
    expect(page).to have_content(category1.title)
    expect(page).to have_content(category2.title)
    expect(page).to have_content(category2.title)

    click_on("#{category1.title}")
    expect(page).to have_content(category1.title)
  end
  scenario "and can delete a category" do
    category1, category2, category3 = create_list(:category, 3)
    visit categories_path
    
    within(first("li.delete")) do
      click_on "delete"
    end
    expect(page).to_not have_content(category1.title)
  end
end
