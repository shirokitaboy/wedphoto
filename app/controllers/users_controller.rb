class UsersController < ApplicationController
  before_action :ensure_correct_user, only: [:show]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
      if @user.save
        ContactMailer.contact_mail(@user).deliver
        session.delete(:user_id) if logged_in?
        session[:user_id] = @user.id
        redirect_to user_path(@user.id)
      else
        render 'new'
      end
  end

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

  def ensure_correct_user
      @user = User.find(params[:id])
      if @user.id != @current_user.id
        flash[:notice] = "権限がありません"
        redirect_to root_url
      end
  end

end
