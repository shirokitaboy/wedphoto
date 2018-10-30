class RecommentsController < ApplicationController
  def create
    @Reply = Recomment.new(recomment_params)
    if @Reply.save
      redirect_back(fallback_location: root_path, notice: "メッセージを投稿しました！")
    else
      redirect_back(fallback_location: root_path, notice: "メッセージを送れませんでした")
    end
  end
  def destroy
    @Reply = Recomment.find(params[:id])
    if @Reply.destroy
      redirect_to posts_url, notice: "メッセージを削除しました"
    end
  end

private
  def recomment_params
    params.require(:recomment).permit(:content, :user_id, :post_id)
  end
  def comment_params
    params.require(:comment).permit(:comment_content, :post_id, :user_id)
  end
end
