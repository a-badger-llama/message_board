class CommentsController < ApplicationController
  def new
  end

  def create
    @comment = Comment.new(comment_params.merge(user: current_user))

    if @comment.save
      flash[:notice] = "Comment created successfully"

      redirect_back fallback_location: posts_path(params: { post: @comment.post.id })
    else
      flash[:alert] = "There was a problem saving the comment"

      redirect_back fallback_location: new_comment_path
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def index
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :post_id)
  end
end
