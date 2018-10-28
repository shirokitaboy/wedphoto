class FavoritesController < ApplicationController
  def create
    favorite = current_user.favorites.create(post_id: params[:post_id])
    redirect_to posts_url, notice: "お気に入り登録しました"
  end
  def destroy
    favorite = current_user.favorites.find_by(id: params[:id]).destroy
    redirect_to posts_url, notice: "お気に入り解除しました"
  end

  def set_variables
    @post = Post.find(params[:post_id])
    @id_name = "#favorite-link-#{@post.id}"
    @id_heart = "#heart-#{@post.id}"
  end
end
