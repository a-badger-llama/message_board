class PostsController < ApplicationController
  def index
    @posts = Post.order(created_at: :desc)
  end

  # def new
  # end

  def create
    @post = Post.new(post_params.merge(user: current_user))

    if @post.save
      flash[:notice] = "Post created successfully"

      redirect_to posts_path
    else
      flash[:alert] = "There was a problem saving the post"

      redirect_back fallback_location: posts_path
    end
  end

  def show
    @post     = Post.find(params[:id])
    @comments = @post.comments
  end

  # def edit
  # end
  #
  # def update
  # end
  #
  # def destroy
  # end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
