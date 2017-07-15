require 'rails_helper'

feature "User adds comment to job" do
  scenario "and sees comment listed below job show page" do
    company = create(:company)
    job = create(:job, company: company)

    visit company_job_path(company, job)

    fill_in "comment[content]", with: "lots of comments here"
    click_on "Create Comment"

    expect(page).to have_content("lots of comments here")
  end
end
