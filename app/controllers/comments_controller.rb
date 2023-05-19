class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @user = @post.author
    @comment = Comment.new(comment_params.merge(author: current_user, post: @post))
    if @comment.save
      redirect_to user_post_path(:user, @post.id)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
