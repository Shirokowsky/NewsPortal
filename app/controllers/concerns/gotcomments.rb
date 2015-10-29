module Gotcomments
  def got_comments(item)
    @commentable = item
    @comments = @commentable.comments
    @comment = Comment.new
  end
end