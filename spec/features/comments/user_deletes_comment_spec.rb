require "rails_helper"

feature "User deletes a comment from a job" do
  scenario "and doesn't see the comment anymore on the page" do
    company = create(:company)
    job = create(:job, company: company)
    comment = create(:comment, job: job)
    job.comments << comment

    visit company_job_path(company.id, job)

    expect(page).to have_content(comment.content)
    within(first("li#delete")) do
      click_on "delete"
    end
    expect(page).to_not have_content(comment.content)
  end
end
