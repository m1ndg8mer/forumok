class CategoriesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :check_owner, only: [:edit, :update, :destroy]

  def index
    @categories = Category.all.order(id: :desc)
  end

  def new
    @category = Category.new
  end

  def show
    initialize_category
    @messages = @category.messages.order(:id)
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
    initialize_category

    if @category.update_attributes(category_params)
      redirect_to @category
    else
      render :edit
    end
  end

  def edit
    initialize_category
  end

  def destroy
    initialize_category
    @category.destroy

    redirect_to categories_path
  end

  private

  def category_params
    params.require(:category).permit(:title, :body)
  end

  def check_owner
    return true if current_user == Category.find(params[:id]).user
    redirect_to categories_path, alert: 'Access Denied!'
  end

  def initialize_category
    @category = Category.find(params[:id])
  end

end
