class CategoriesController < ApplicationController
  def new
    @category = Category.new()
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      flash[:success] = "#{@category.title} added!"
      redirect_to @category
    else
      render :new
    end
  end

  private

  def category_params
    params.require(:category).permit(:title)
  end
end
