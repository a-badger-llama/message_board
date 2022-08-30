class CommentsController < ApplicationController
  # def index
  # end
  #
  # def new
  # end

  def create
    @comment = Comment.new(comment_params.merge(user: current_user))

    if @comment.save
      flash[:notice] = "Comment created successfully"

      redirect_back fallback_location: posts_path
    else
      flash[:alert] = "There was a problem saving the comment"

      redirect_back fallback_location: posts_path
    end
  end

  # def show
  # end
  #
  # def edit
  # end
  #
  # def update
  # end
  #
  # def destroy
  # end

  private

  def comment_params
    params.require(:comment).permit(:body, :commentable_id, :commentable_type)
  end
end
