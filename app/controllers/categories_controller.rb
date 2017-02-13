class CategoriesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action -> { owner }, only: [:edit, :update, :destroy]

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
    @category = current_user.categories.new(category_params)

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
    params.require(:category).permit(:title, :body)
  end

  def owner
    category = Category.find(params[:id])
    unless current_user == category.user
      redirect_to category
    end
  end

end
