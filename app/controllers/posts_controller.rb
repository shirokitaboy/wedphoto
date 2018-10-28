class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :login_ck, only: [:index, :show, :edit, :update, :destroy]

  def index
    #@posts = Post.all
    @search = Post.ransack(params[:q])
    @posts = @search.result(distinct: true)
  end

  def new
    if params[:back]
       @post = Post.new(post_params)
    else
       @post = Post.new
    end
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to posts_path, notice: "投稿しました！"
    else
      render 'new'
    end
  end

  def show
    #@post = Post.find(params[:id])
    @user = User.find_by(id: @post.user_id)
    @favorite = current_user.favorites.find_by(post_id: @post.id)
    @comments = @post.recomments
    @comment = Recomment.new
  end

  def edit
    #@post = Post.find(params[:id])
  end

  def update
    #@post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to posts_path, notice: "編集しました！"
    else
      render 'edit'
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path, notice:"削除しました！"
  end

  def confirm
    @post = Post.new(post_params)
    #なぜかuserパラメータに対してバリデーションエラー
    render :new if @post.invalid?
  end

  def gallery
    @randposts = Post.order("RANDOM()").limit(5)# 投稿をランダム取得
  end


  private
  def post_params
    params.require(:post).permit(:comment, :image, :image_cache)
  end
  def set_post
    @post = Post.find(params[:id])
  end
  def login_ck
    unless current_user
      flash[:notice] = '不正を検知しました'
      render new_session_path
    end
  end

end
