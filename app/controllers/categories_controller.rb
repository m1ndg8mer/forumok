class CategoriesController < ApplicationController

  def index
    @categories = Category.all.order(id: :desc)
  end

  def new
    @category = Category.new
  end

  def show
    @category = Category.find(params[:id])
    @messages = @category.messages.order(id: :desc)
  end

  def create
    @category = Category.new(category_params)
    @category.user = User.first # it's for correct adding

    if @category.save
      redirect_to @category
    else
      render :new
    end
  end

  def update
    @category = Category.find(params[:id])

    if @category.update_attributes(category_params)
      redirect_to @category
    else
      render :edit
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def destroy
    Category.find(params[:id]).destroy

    redirect_to categories_path
  end

  private

  def category_params
    params.require(:category).permit(:title)
  end

end
