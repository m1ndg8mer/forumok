class CategoriesController < ApplicationController
  load_and_authorize_resource
  before_action :authenticate_user!, except: [:index, :show]
  before_action :initialize_category, except: [:index, :new, :create]

  def index
    @categories = Category.all.order(id: :desc)
  end

  def new
    @category = Category.new
  end

  def show
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
    if @category.update_attributes(category_params)
      redirect_to @category
    else
      render :edit
    end
  end

  def edit
  end

  def destroy
    @category.destroy

    redirect_to categories_path
  end

  private

  def category_params
    params.require(:category).permit(:title, :body)
  end

  def initialize_category
    @category = Category.find(params[:id])
  end

end
