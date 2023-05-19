class LikesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @user = @post.author
    @like = Like.new(author: current_user, post: @post)
    if @like.save 
      redirect_to user_post_path(:user, @post.id)
    else
      render :new, status: :unprocessable_entity
    end
  end
end
