class CategoriesController < ApplicationController
  include ApplicationHelper

  load_and_authorize_resource
  before_action :authenticate_user!, except: [:index, :show]
  before_action :initialize_category, except: [:index, :new, :create]

  def index
    if check_role? [:admin, :moderator]
      @categories = Category.paginate(:page => params[:page], :per_page => 10)
    else
      @categories = Category.published.paginate(:page => params[:page], :per_page => 10)
    end
  end

  def new
    @category = Category.new
  end

  def show
    unless @category.published
      redirect_to categories_path, :alert => 'The category is not published yet!'
    end
    @messages = @category.messages.paginate(:page => params[:page], :per_page => 10).order(:id)
  end

  def create
    @category = current_user.categories.new(category_params)

    if @category.save
      redirect_to categories_path, :notice => 'Your category is reviewing by moderator.'
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
    @category.messages.each(&:destroy!)
    @category.destroy

    redirect_to categories_path
  end

  def publish
    Category.update(@category.id, published: !@category.published)
    redirect_to categories_path, :notice => 'Updated!'
  end

  private

  def category_params
    params.require(:category).permit(:title, :body)
  end

  def initialize_category
    @category = Category.find(params[:id])
  end

end
