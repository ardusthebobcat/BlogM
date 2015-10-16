class TagsController < ApplicationController
  def index
    @tags = Tag.all
    render :all_tags
  end

  def new
    @post = Post.find(params[:post_id])
    @tag = @post.tags.new()
  end

  def create
    @post = Post.find(params[:post_id])
    @tag = @post.tags.create(tag_params)
    if @post.save
      redirect_to post_path(@post)
    else
      render :new
    end
  end

  ## I purposely left out "show", because I dont have the form/routes to add a single tag to multiple posts yet, and it would only show the tag and the 1 single post. As a multi-week code review + wanting to do something cool with the tags list, I figured I could leave this feature out until later in the weekend or early next week. The ability is there and the join table clearly works [psql queries can prove it].
  def edit
    @post = Post.find(params[:post_id])
    @tag = Tag.find(params[:id])
  end

  def update
    @post = Post.find(params[:post_id])
    @tag = Tag.find(params[:id])

    if @tag.update(tag_params)
      redirect_to post_path(@post)
    else
      render :edit
    end
  end

  def destroy
    #Im pretty sure both the post_tag_path#destroy route and the tag_path#destroy both target this same destroy. I dont have a way to include a pre-made tag in with additional posts, yet, so I cant be sure that this block is "foolproof".
    @tag = Tag.find(params[:id])
    if params[:post_id]
      @post = Post.find(params[:post_id])
    else
      @post = @tag.posts.all
    end
    @tag.destroy
    redirect_to root_path
  end

  private
  def tag_params
    params.require(:tag).permit(:title)
  end
end
