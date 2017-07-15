require 'rails_helper'

describe Job do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without a title" do
        category = Category.create!(title: "Technical")
        job = Job.new(level_of_interest: 80, description: "Wahoo", city: "Denver", category_id: category.id)
        expect(job).to be_invalid
      end

      it "is invalid without a level of interest" do
        category = Category.create!(title: "Technical")
        job = Job.new(title: "Developer", description: "Wahoo", city: "Denver", category_id: category.id)
        expect(job).to be_invalid
      end

      it "is invalid without a city" do
        category = Category.create!(title: "Technical")
        job = Job.new(title: "Developer", description: "Wahoo", level_of_interest: 80, category_id: category.id)
        expect(job).to be_invalid
      end
    end

    context "valid attributes" do
      it "is valid with a title, level of interest, and company" do
        company = Company.new(name: "Turing")
        category = Category.create!(title: "Technical")
        job = Job.new(title: "Developer", level_of_interest: 40, city: "Denver", company: company, category_id: category.id)
        expect(job).to be_valid
      end
    end
  end

  describe "relationships" do
    it "belongs to a company" do
      job = Job.new(title: "Software", level_of_interest: 70, description: "Wahooo")
      expect(job).to respond_to(:company)
    end
  end
end
