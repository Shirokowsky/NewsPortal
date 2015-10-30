class ArticlesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  before_action :get_parent

  include Gotcomments

  respond_to :html

  def index
    if user_signed_in? && current_user.admin?
      @articles= Article.all.paginate(page: params[:page])
    else
      @articles = Article.accepted
    end
  end

  def show
    got_comments(@article)
    respond_with(@article)
  end

  def new
    @article = @parent.articles.build
    @category = Category.new
    respond_with(@article)
  end

  def edit

  end

  def create
    @article = @parent.articles.build(article_params)
    @category = Category.new
    redirect_to @article if @article.save
  end

  def update
    @article.update(article_params)
    respond_with(@article)
  end

  def destroy
    @article.destroy
    respond_with(@article)
  end

  private

  def get_parent
    @parent = current_user
  end

  def set_article
    @article = Article.find(params[:id])
  end

  def valid_user
    unless @article.patternable_id == current_user.id || current_user.admin?
      redirect_to root_path, notice: 'Only owner or admin can do that'
    end
  end

  def article_params
    if current_user.admin?
      params.require(:article).permit(:title, :description, :text, :accepted, category_ids:[])
    else
      params.require(:article).permit(:title, :description, :text, category_ids:[])
    end
  end

end