class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :destroy]
  before_action :authenticate_user!, only: [:new,:create,:destroy]
  before_action :valid_user, only: [:new,:create,:destroy]

  def index
    @categories = Category.includes(:category_links).all
  end

  def show
    @categories = Category.all
    #@articles = Article.where(categorable_id: @category.id)
    if user_signed_in? && current_user.admin?
      @articles = @category.articles.paginate(page: params[:page])
    else
      @articles = @category.articles.accepted.paginate(page: params[:page])
    end
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    @category.save
    respond_to do |format|
      format.html { redirect_to categories_path, notice: 'category created fine'}
    end
  end

  def destroy
    @category.delete
    respond_to do |format|
      format.html { redirect_to categories_path, notice: 'category killed'}
    end
  end

  private
  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:title)
  end

  def valid_user
    unless current_user.admin?
      redirect_to root_path, notice: 'Only admin can do that'
    end
  end

end