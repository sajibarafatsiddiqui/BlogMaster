module Api
    class CommentsController < ApplicationController
      def index
        @post = Post.find(params[:post_id])
        @user = @post.author
        @comments = @post.comments.all
        render :json => @comments 
      end

      def create
        @post = Post.find(params[:post_id])
        @user = @post.author
        @comment = Comment.new(comment_params.merge(author: current_user, post: @post))
        @comment.save
        render json: @comment, status: :created
      end
      private

      def comment_params
        params.require(:comment).permit(:text)
      end
    end
  end