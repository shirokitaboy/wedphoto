class UsersController < ApplicationController
  before_action :correct_user, only: [ :show]
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_path(@user.id)
    else
      render 'new'
    end
  end

  #ユーザーid取得
  def show
    @user = User.find(params[:id])
    @posts = @user.posts
    @favorite_posts = @user.favorite_posts
    #@favorite = current_user.favorites.find_by(post_id: @post.id)
  end

  def confirm
    @user = User.new(user_params)
    render :new if @user.invalid?
  end

private
  def user_params
    params.require(:user).permit(:name,:email,:password,:password_confirmation)
  end
  def correct_user
  @post = current_user.posts.find_by(id: params[:id])
    unless @post
      redirect_to root_url
    end
end

end
