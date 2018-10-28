class RecommentsController < ApplicationController
  def create
    @comment = Recomment.new(recomment_params)
    if @comment.save
      redirect_back(fallback_location: root_path)
    else
      redirect_back(fallback_location: root_path)
    end
  end
  def destroy
    @comment = Recomment.find(params[:id])
    if @comment.destroy
      redirect_to posts_url, notice: "コメント削除しました"
    end
  end

private
  def recomment_params
    params.require(:recomment).permit(:content, :user_id, :post_id)
  end
end


def destroy
  @comment = Comment.find(params[:id])
  if @comment.destroy
    render :index, notice; 'コメント削除しました'
  end
end

private
  def comment_params
    params.require(:comment).permit(:comment_content, :post_id, :user_id)
  end
