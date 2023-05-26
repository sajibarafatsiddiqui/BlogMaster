class PostsController < ApplicationController
  load_and_authorize_resource
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts.includes(comments: %i[post author])
  end

  def new
    @first_user = current_user
    @post = Post.new
  end

  def create
    # new object from params
    @post = Post.new(post_params.merge(author: current_user, commentscounter: 0, likescounter: 0))
    if @post.save
      redirect_to user_post_path(:user, @post.id)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @user = User.find(params[:user_id])
    @post = Post.find(params[:id])
    @comment = @post.comments.build
  end

  def destroy
    @post = Post.find(params[:id])
    @user = @post.author
    @post.destroy
    redirect_to user_posts_path(@user)
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end


end
