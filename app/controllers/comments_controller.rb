class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:destroy]
  before_action :load_comm
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  def index
    @comments = @commentable.comments
  end

  def new
    @comment = @commentable.comments.new
  end

  def create
    @comment = @commentable.comments.new(comment_params)

    # TODO refactor me
    if user_signed_in?
      @comment.user_id = current_user.id
    else
      @comment.user_id = nil
    end

    if @comment.save
      flash[:notice] = 'Comment created'
      respond_to do |format|
        format.html { redirect_to @commentable }
        format.js
      end
    end
  end

  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to @commentable, notice: 'comment deleted'}
      format.js
    end
  end


  private

  def comment_params
    params.require(:comment).permit(:text)
  end

  def load_comm
    resource, id = request.path.split('/')[1,2]
    @commentable = resource.singularize.classify.constantize.find(id)
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end
end
