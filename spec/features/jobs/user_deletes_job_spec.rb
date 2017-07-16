require 'rails_helper'

RSpec.feature "User deletes existing job" do
  scenario "and doesnt see it on the linked company/jobs index page" do
    job = create(:job)
    job2 = create(:job, :company_id => job.company.id)
    job3 = create(:job, :company_id => job.company.id)
    jobtitle = "Clean Toilets-4"
    job2title = "Clean Toilets-5"
    visit company_jobs_path(job.company)
    
    expect(first("//li").text).to have_text(jobtitle)
    expect(page).to have_content(job2title)
    click_on("delete", :match => :first)

    expect(page).to_not have_text(jobtitle)
    expect(page).to have_text(job2title)
  end
end
