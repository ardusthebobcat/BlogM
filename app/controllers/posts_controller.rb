class PostsController < ApplicationController
  def index
    @posts = Post.all
    render :index
  end

  def new
    @post = Post.new()
    render :new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to post_path(@post.id)
    else
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to post_path(@post.id)
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    @posts = Post.all
    render :index
  end

  private
  def post_params
    params.require(:post).permit(:title, :author)
  end

end
