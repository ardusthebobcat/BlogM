class CommentsController < ApplicationController
  def new
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new
  end

  def create
    @post = Post.find(params[:post_id])
    temp_params = comm_params
    temp_params[:user_id] = @post.author
    @comment = @post.comments.new(temp_params)
    if @comment.save
      redirect_to post_path(@post)
    else
      render :new
    end
  end

  def destroy
    @comment = Post.find(params[:post_id]).comments.find(params[:id])
    @comment.destroy

    redirect_to post_path(@post)
  end

  private
  def comm_params
    params.require(:comment).permit(:content, :user_id, :post_id)
  end
end
