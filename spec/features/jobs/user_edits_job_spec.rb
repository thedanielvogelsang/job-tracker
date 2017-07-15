require 'rails_helper'

RSpec.feature "User visits a job show page and clicks edit" do
  scenario "and, after filling out new data, sees updated data on following page" do

    job = create(:job)
    new_job = build(:job, title: "New Job", level_of_interest: 98, company_id: job.company.id)

    visit company_jobs_path(job.company)

    expect(job.title).to eq("Clean Toilets-4")
    expect(job.level_of_interest).to eq(48)
    expect(job.city).to eq("Denver")


    click_on("Edit")
    save_and_open_page

    expect(find_field("job_title").value).to eq 'Clean Toilets-4'
    fill_in "job_title", with: new_job.title
    fill_in "job_level_of_interest", with: new_job.level_of_interest

    click_on("Update Job")

    expect(page).to have_content("New Job")
    expect(page).to have_content("Denver")
    expect(page).to_not have_content(48)
  end
end
