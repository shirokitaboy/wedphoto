class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update]
  #index
  def index
    #@posts = Post.all
    # 検索オブジェクト
    @search = Post.ransack(params[:q])
    # 検索結果
    @posts = @search.result(distinct: true)
  end

  #新規投稿画面
  def new
    if params[:back]
       @post = Post.new(post_params)
    else
       @post = Post.new
    end
  end

  #新規投稿
  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      # 一覧画面へ遷移して"投稿しました！"とメッセージを表示します。
      redirect_to posts_path, notice: "投稿しました！"
    else
      # 入力フォームを再描画します。
      render 'new'
    end
  end

  def show
    #@post = Post.find(params[:id])
    # 変数@userを定義
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

  #投稿削除
  def destroy
    @post.destroy
    redirect_to posts_path, notice:"削除しました！"
  end

  def confirm
    @post = Post.new(post_params)
  end

  def gallery
    @randposts = Post.order("RANDOM()").limit(5)# 投稿をランダム取得
  end
  private
  def post_params
    params.require(:post).permit(:comment, :image, :image_cache, :user_id)
  end

  def set_post
    @post = Post.find(params[:id])
  end

  def correct_user
    @post = current_user.posts.find_by(id: params[:id])
      unless @post
        redirect_to root_url
      end
  end
end
