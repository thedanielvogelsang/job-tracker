require 'rails_helper'

RSpec.feature "User visits a job show page and clicks edit" do
  scenario "and, after filling out new data, sees updated data on following page" do

    job = create(:job)
    new_job = create(:job, title: "New Job", level_of_interest: 98)

    visit company_jobs_path(job.company.id)
    expect(job.title).to eq("Clean Toilets")
    expect(job.level_of_interest).to eq(48)
    expect(job.city).to eq("Denver")
    expect(page).to have_content(job.title)
    click_on("Edit")
    save_and_open_page
    fill_in "job_title", with: new_job.title
    fill_in "job_level_of_interest", with: new_job.level_of_interest

    click_on("Update Job")
    expect(page).to have_content("New Job")
    expect(page).to have_content("Denver")
    expect(page).to_not have_content(48)
  end
end
