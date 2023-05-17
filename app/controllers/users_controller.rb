class UsersController < ApplicationController
  def index 
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @first_three_post = @user.first_three_post
  end
end
